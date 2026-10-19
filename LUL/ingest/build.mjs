// Step 2 of the LUL ingest pipeline: turn _work/runs.jsonl (from extract.mjs)
// into the book's markdown files: foreword.md, introduction.md,
// about-this-book.md and the 34 diary pages 2020-03-21.md … 2020-04-23.md.
//
//   node LUL/ingest/build.mjs
//
// Typography of the typeset PDF (what the classifier relies on):
//   SegoeUI-Light 10/11      body text (entries, essay, front matter)
//   SegoeUI 10               the editors' news-context paragraph that opens each day
//   SegoeUI-*Italic          italics;  SegoeUI-Semibold = bold
//   SegoeUI-Light 10.5 "***" separator between diary entries
//   SegoeUI-Light ~5.8 digit  footnote marker (superscript)
//   Gudea 8 at left margin    footnote bodies / figure + table captions
//   Gudea-Bold 14             section headings (essay) and date headings (diary)
//   Gudea(-Bold) 16/20        part titles (FOREWORD, DIARY ENTRIES, …)
//   TradeGothic / Gudea 6.6   running headers; Gudea 10/11 at y>680 = folio
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const here = path.dirname(fileURLToPath(import.meta.url));
const BOOK = path.resolve(here, "..");
const WORK = path.join(here, "_work");
const rows = fs.readFileSync(path.join(WORK, "runs.jsonl"), "utf8").trim().split("\n").map(JSON.parse);

// ---------------------------------------------------------------- helpers
const fam = (f) => f.replace(/^[A-Z]{6}\+/, "");
const isSegoe = (r) => /^SegoeUI/.test(fam(r.font));
const isGudea = (r) => /^Gudea/.test(fam(r.font));
const COL_RIGHT = { odd: 460, even: 445 };     // right edge of the justified column
const colRight = (p) => (p % 2 ? COL_RIGHT.odd : COL_RIGHT.even);

// Hyphenated words seen in the Word drafts – used to decide whether a hyphen at
// a line end is a real compound (keep) or typesetting hyphenation (drop).
const dictDir = path.join(WORK, "docx");
const hyphenated = new Set();
const plainWords = new Set();
if (fs.existsSync(dictDir)) {
  for (const f of fs.readdirSync(dictDir)) {
    const t = fs.readFileSync(path.join(dictDir, f), "utf8");
    for (const m of t.matchAll(/[A-Za-z’']+(?:-[A-Za-z’']+)+/g)) hyphenated.add(m[0].toLowerCase());
    for (const m of t.matchAll(/[A-Za-z’']+/g)) plainWords.add(m[0].toLowerCase());
  }
}

// ---------------------------------------------------------------- classify runs
// → {page, y, x, w, size, kind, italic, bold, str}
const runs = [];
for (const r of rows) {
  if (r.str === "" || r.str === " " || !r.str.trim()) continue;
  if (r.y < 70) continue;                               // running header
  if (r.y > 680 && isGudea(r)) continue;                // folio
  const f = fam(r.font);
  let kind = null;
  if (isSegoe(r) && r.size === 10.5 && r.str.trim() === "***") kind = "sep";
  else if (isSegoe(r) && r.size >= 9.9 && r.size <= 11.2) kind = "body";
  else if (isSegoe(r) && r.size === 9) kind = "body";                       // numbered list (p. 9)
  else if (isSegoe(r) && r.size >= 5.7 && r.size <= 6.5 && /^\d{1,2}$/.test(r.str.trim())) kind = "marker";
  else if (isSegoe(r) && r.size >= 5.7 && r.size <= 6.5 && /^(st|nd|rd|th)$/.test(r.str.trim())) kind = "ordinal";
  else if (f === "Gudea-Bold" && r.size === 14) kind = "h2";
  else if ((f === "Gudea-Bold" || f === "Gudea") && r.size >= 16) kind = "title";
  else if (isGudea(r) && r.size === 8) kind = "small";                    // footnotes, captions, table
  else if (f === "Gudea-Bold" && r.size === 9) kind = "small";            // table header
  else continue;                                                           // chart text etc.
  runs.push({ page: r.page, y: r.y, x: r.x, w: r.w, size: r.size, kind, font: r.font, italic: r.italic, bold: r.bold, str: r.str });
}

// ---------------------------------------------------------------- lines
// Group runs of the same kind on the same baseline into lines.
function makeLines(rs) {
  const lines = [];
  const sorted = [...rs].sort((a, b) => a.page - b.page || a.y - b.y || a.x - b.x);
  for (const r of sorted) {
    const last = lines[lines.length - 1];
    if (last && last.page === r.page && last.kind === r.kind && Math.abs(last.y - r.y) <= 2.5) {
      last.runs.push(r);
    } else {
      lines.push({ page: r.page, y: r.y, kind: r.kind, runs: [r] });
    }
  }
  for (const l of lines) {
    l.runs.sort((a, b) => a.x - b.x);
    l.x = l.runs[0].x;
    l.right = Math.max(...l.runs.map((r) => r.x + r.w));
    l.size = l.runs[0].size;
  }
  return lines;
}

// Join the runs of a line into styled segments: [{t, i, b}]
function lineSegments(line) {
  const segs = [];
  let prev = null;
  for (const r of line.runs) {
    let t = r.str;
    if (prev) {
      const gap = r.x - (prev.x + prev.w);
      const needSpace = gap > 0.12 * r.size && !/\s$/.test(prev.str) && !/^\s/.test(t);
      if (needSpace) segs.push({ t: " ", i: false, b: false });
    }
    segs.push({ t, i: r.italic, b: r.bold });
    prev = r;
  }
  return segs;
}

// Insert text at a character offset inside a segment list.
function insertAt(segs, offset, text) {
  let pos = 0;
  for (const s of segs) {
    if (offset <= pos + s.t.length) {
      const k = offset - pos;
      s.t = s.t.slice(0, k) + text + s.t.slice(k);
      return;
    }
    pos += s.t.length;
  }
  segs[segs.length - 1].t += text;
}

// Estimate the character offset in a line at horizontal position x, snapped to
// the nearest word boundary (after a non-space, before a space/end).
function offsetAtX(line, segs, x) {
  const full = segs.map((s) => s.t).join("");
  // find the run under/left of x
  let est = 0, acc = 0;
  let found = false;
  for (let i = 0; i < line.runs.length; i++) {
    const r = line.runs[i];
    const segStart = full.indexOf(r.str, acc);
    const start = segStart >= 0 ? segStart : acc;
    if (x <= r.x + r.w + 0.5 || i === line.runs.length - 1) {
      const frac = Math.max(0, Math.min(1, (x - r.x) / (r.w || 1)));
      est = start + Math.round(frac * r.str.length);
      found = true;
      break;
    }
    acc = start + r.str.length;
  }
  if (!found) est = full.length;
  // snap to a word boundary
  const bounds = [];
  for (let p = 1; p <= full.length; p++) {
    if (!/\s/.test(full[p - 1]) && (p === full.length || /\s/.test(full[p]))) bounds.push(p);
  }
  if (!bounds.length) return est;
  let best = bounds[0];
  for (const b of bounds) if (Math.abs(b - est) < Math.abs(best - est)) best = b;
  return best;
}

// Render segments to markdown (italic/bold), keeping spaces outside the marks.
function segsToMd(segs) {
  // merge adjacent segments with same style
  const m = [];
  for (const s of segs) {
    const last = m[m.length - 1];
    if (last && last.i === s.i && last.b === s.b) last.t += s.t;
    else m.push({ ...s });
  }
  // spaces-only segments adopt neutral style
  let out = "";
  for (const s of m) {
    if (!s.t.trim()) { out += s.t; continue; }
    const lead = s.t.match(/^\s*/)[0], trail = s.t.match(/\s*$/)[0];
    let core = s.t.trim();
    if (s.i && s.b) core = `***${core}***`;
    else if (s.i) core = `*${core}*`;
    else if (s.b) core = `**${core}**`;
    out += lead + core + trail;
  }
  // fix "*word*s" style artefacts: punctuation directly after closing mark is fine;
  // but "*Life under*\n*Lockdown*" merges are handled at paragraph level.
  return out;
}

// Join two consecutive lines of a paragraph (hyphenation rule).
const hyphenLog = [];
function joinLines(a, b) {
  const r = joinLines0(a, b);
  if (/-$/.test(a)) hyphenLog.push(`${a.slice(-25)} | ${b.slice(0, 20)}  =>  ${r.slice(Math.max(0, a.length - 25), a.length + 20)}`);
  return r;
}
function joinLines0(a, b) {
  const m = a.match(/([A-Za-z’']+)-$/);
  if (m && /^[a-z]/.test(b)) {
    const left = m[1];
    const right = b.match(/^[A-Za-z’']+/)[0];
    const compound = (left + "-" + right).toLowerCase();
    const joined = (left + right).toLowerCase();
    if (hyphenated.has(compound)) return a + b;                 // keep hyphen
    if (plainWords.has(joined)) return a.slice(0, -1) + b;      // drop soft hyphen
    if (hyphenated.has(compound.replace(/[’']s$/, ""))) return a + b;
    // unknown: this edition is typeset without soft hyphenation, so a hyphen at a
    // line end is almost always a real compound – keep it.
    return a + b;
  }
  if (/-$/.test(a)) return a + b;      // hyphen before capital / digit: keep as is, no space
  return a + " " + b;
}

// ---------------------------------------------------------------- blocks
// Walk the lines of a page range and emit blocks:
//   {type:'title'|'h2'|'para'|'context'|'sep'|'figure'|'table'|'fn', text, n}
function buildBlocks(pFrom, pTo, opts = {}) {
  const inRange = runs.filter((r) => r.page >= pFrom && r.page <= pTo);
  const markers = inRange.filter((r) => r.kind === "marker");
  const ordinals = inRange.filter((r) => r.kind === "ordinal");
  const lines = makeLines(inRange.filter((r) => !["marker", "ordinal"].includes(r.kind)));

  // attach markers / ordinals to the body line just below them
  const bodyLines = lines.filter((l) => l.kind === "body");
  for (const l of bodyLines) l.segs = lineSegments(l);
  const attach = (m, text) => {
    const cands = bodyLines.filter((l) => l.page === m.page && l.y > m.y && l.y - m.y <= 7);
    if (!cands.length) { console.warn(`  !! marker ${JSON.stringify(m.str)} p${m.page} y${m.y} not attached`); return; }
    const l = cands[0];
    const off = offsetAtX(l, l.segs, m.x + m.w / 2);
    insertAt(l.segs, off, text);
    if (opts.log) {
      const full = l.segs.map((s) => s.t).join("");
      const k = full.indexOf(text);
      console.log(`  marker ${text.padEnd(6)} p${m.page}: …${full.slice(Math.max(0, k - 30), k + text.length + 12)}…`);
    }
  };
  for (const m of markers) attach(m, `[^${m.str.trim()}]`);
  for (const o of ordinals) {
    // ordinals sit on the baseline of their own line (superscript raised ~3pt)
    const cands = bodyLines.filter((l) => l.page === o.page && Math.abs(l.y - o.y) <= 7);
    if (!cands.length) continue;
    const l = cands[0];
    const off = offsetAtX(l, l.segs, o.x - 0.1);   // right after the number
    // offsetAtX snaps to word end; the number is the word before the ordinal
    insertAt(l.segs, off, o.str.trim());
  }

  const blocks = [];
  let para = null;        // {type, lines:[md strings], lastLine}
  const flush = () => {
    if (!para) return;
    let text = para.lines.reduce((acc, s) => (acc === null ? s : joinLines(acc, s)), null);
    text = cleanup(text);
    blocks.push({ type: para.type, text, page: para.page });
    para = null;
  };

  let prevBody = null;    // last body line seen (for gap / page-break logic)
  let fn = null;          // current footnote {n, lines}
  let lastFn = 0;
  const flushFn = () => {
    if (!fn) return;
    let text = fn.lines.reduce((acc, s) => (acc === null ? s : joinLines(acc, s)), null);
    blocks.push({ type: "fn", n: fn.n, text: cleanup(text) });
    fn = null;
  };

  for (const l of lines) {
    if (l.kind === "body") {
      const md = segsToMd(l.segs);
      const isContext = l.runs.every((r) => fam(r.font) === "SegoeUI" || fam(r.font) === "SegoeUI-Italic" || fam(r.font) === "SegoeUI-Semibold") && opts.contextFont;
      let type = isContext ? "context" : "para";
      const leading = l.size >= 10.9 ? 16 : 14;
      const allBold = l.runs.every((r) => r.bold);
      if (opts.signatures && allBold) type = "sig";
      if (l.size === 9 && /^\d+\.$/.test(l.runs[0].str.trim())) type = "li";
      let newPara = !para || para.type !== type || type === "sig" || type === "li";
      if (!newPara && prevBody) {
        if (prevBody.page === l.page) {
          if (l.y - prevBody.y > leading * 1.35) newPara = true;
        } else {
          // page break: continue only if the previous line filled the column
          if (prevBody.right < colRight(prevBody.page) - 14) newPara = true;
        }
      }
      if (newPara) { flush(); para = { type, lines: [], page: l.page }; }
      para.lines.push(md);
      prevBody = l;
      continue;
    }
    // any non-body line ends the current paragraph
    if (l.kind !== "small") { flush(); flushFn(); }
    const text = segsToMd(lineSegments(l).map((s) => (l.kind === "h2" || l.kind === "title" ? { ...s, b: false } : s))).trim();
    if (l.kind === "sep") { blocks.push({ type: "sep" }); prevBody = null; }
    else if (l.kind === "h2") { blocks.push({ type: "h2", text, page: l.page }); prevBody = null; }
    else if (l.kind === "title") { blocks.push({ type: "title", text, page: l.page }); prevBody = null; }
    else if (l.kind === "small") {
      const first = l.runs[0].str.trim();
      if (/^Figure \d+$/.test(first)) {
        flush(); flushFn();
        const cap = segsToMd(lineSegments({ runs: l.runs.slice(1) })).trim();
        blocks.push({ type: "figure", n: +first.split(" ")[1], text: cleanup(cap), page: l.page });
      } else if (/^Table \d+$/.test(first)) {
        flush(); flushFn();
        const cap = segsToMd(lineSegments({ runs: l.runs.slice(1) })).trim();
        blocks.push({ type: "table", n: +first.split(" ")[1], text: cleanup(cap), page: l.page });
      } else if (l.page === 29 && l.y >= 110 && l.y <= 270) {
        // Table 1 rows – rendered from a template instead
      } else if (/^\d{1,2}$/.test(first) && l.runs.length > 1 && l.x < 95 && +first === lastFn + 1) {
        flushFn();
        lastFn = +first;
        fn = { n: +first, lines: [segsToMd(lineSegments({ runs: l.runs.slice(1) })).trim()] };
      } else if (fn) {
        fn.lines.push(text);
      } else {
        console.warn(`  !! stray small line p${l.page}: ${text.slice(0, 60)}`);
      }
    }
  }
  flush(); flushFn();
  return blocks;
}

function cleanup(t) {
  return t
    .replace(/­/g, "")
    .replace(/\s+—\s+|—/g, " – ")          // house rule: en-dashes only
    .replace(/ {2,}/g, " ")
    .replace(/\*\*\* *\*\*\*/g, "")           // empty bold+italic
    .replace(/(?<!\*)\* \*(?!\*)/g, " ")       // "*a* *b*" artefacts from split italic runs
    .replace(/(\S)\*(\S)\*(\s|$)/g, "$1$2$3") // stray single-letter italic islands like "di*v*erse"
    .trim();
}

// Escape things that pandoc would otherwise interpret at paragraph start.
function safePara(t) {
  return t.replace(/^(\d+)\. /, "$1\\. ").replace(/^([#>+-]) /, "\\$1 ");
}

// ---------------------------------------------------------------- compose
const utf8 = { encoding: "utf8" };
const write = (name, content) => {
  fs.writeFileSync(path.join(BOOK, name), content.replace(/\r\n/g, "\n"), utf8);
  console.log(`  wrote ${name}`);
};

function renderBlocks(blocks, { fnScope = true, diary = false } = {}) {
  const out = [];
  const fns = [];
  let seenSep = false;
  for (let i = 0; i < blocks.length; i++) {
    const b = blocks[i];
    if (b.type === "para") {
      // short unpunctuated lines inside an entry are the writer's own sub-headings
      if (diary && b.text.length < 45 && !/[.!?…”’)\]]$/.test(b.text)) out.push(`**${b.text}**`);
      else out.push(safePara(b.text));
    }
    else if (b.type === "li") {
      const items = [b.text];
      while (blocks[i + 1] && blocks[i + 1].type === "li") items.push(blocks[++i].text);
      out.push(items.map((t) => t.replace(/^(\d+)\.\s*/, "$1. ")).join("\n"));
    }
    else if (b.type === "sig") {
      const lines = [b.text];
      while (blocks[i + 1] && blocks[i + 1].type === "sig") lines.push(blocks[++i].text);
      out.push(`::: {.signature}\n${lines.map((t) => t.replace(/^\*\*|\*\*$/g, "")).join("\\\n")}\n:::`);
    }
    else if (b.type === "context") { seenSep = false; out.push(`::: {.day-context}\n${b.text}\n:::`); }
    else if (b.type === "sep" && diary && !seenSep) { seenSep = true; }   // the first *** of a day follows the context box
    else if (b.type === "sep") out.push(`::: {.entry-break}\n\\* \\* \\*\n:::`);   // escaped: a bare *** would become an <hr>
    else if (b.type === "h2") out.push(`## ${b.text}`);
    else if (b.type === "title") { /* handled by file templates */ }
    else if (b.type === "figure") out.push(FIGURES[b.n] ? FIGURES[b.n](b.text) : `<!-- figure ${b.n} -->`);
    else if (b.type === "table") out.push(TABLE1);
    else if (b.type === "fn") fns.push(`[^${b.n}]: ${b.text}`);
  }
  let md = out.join("\n\n");
  if (fnScope && fns.length) md += "\n\n" + fns.join("\n\n");
  return md + "\n";
}

const FIGURES = {
  1: (cap) => fig("figure-1.png", cap, "Figure 1", "Screenshot of a spreadsheet grouping the most frequent diary words into themes, with a bar chart titled Topics of Discussion"),
  2: (cap) => fig("figure-2.jpg", cap, "Figure 2", "A colourful word cloud in the shape of a map pin, built from 27 000 diary words"),
  3: (cap) => fig("figure-3.jpg", cap, "Figure 3", "Two word clouds: a frequency cloud of all diary words and a positive/negative sentiment cloud"),
  4: (cap) => fig("figure-4.jpg", cap, "Figure 4", "Line chart of weekly average sentiment of the diary entries with the key themes of each week annotated"),
  5: (cap) => fig("figure-5.jpg", cap, "Figure 5", "Weekly sentiment above a line chart of daily Covid-19 tests, cumulative cases and deaths in South Africa, 21 March to 23 April 2020"),
  6: (cap) => fig("figure-6.jpg", cap, "Figure 6", "Cumulative Covid-19 cases and deaths in South Africa from March 2020 to April 2021 with the diary period shaded"),
  7: (cap) => fig("figure-7.jpg", cap, "Figure 7", "Three panels: weekly diary sentiment, the JSE All Share Index and the rand/dollar exchange rate over the diary period"),
};
function fig(file, cap, label, alt) {
  return `![](images/${file}){.book-figure fig-alt="${alt.replace(/"/g, "'")}"}\n\n::: {.figure-caption}\n${label} ${cap}\n:::`;
}
const TABLE1 = `::: {.figure-caption .table-caption}
Table 1 AFINN sentiment scores for words in the diary entries
:::

| Word | Sentiment score |
|:-----|---------------:|
| Bullshit | −4 |
| Catastrophic | −4 |
| Panic | −3 |
| Fake | −3 |
| Worse | −3 |
| Funny | 4 |
| Fun | 4 |
| Wonderful | 4 |
| Thrilled | 5 |

: {.table-plain tbl-colwidths="[50,50]"}`;

// ---- Foreword (PDF pp. 13–15)
console.log("Foreword");
{
  const blocks = buildBlocks(13, 15, { log: true, signatures: true });
  const body = renderBlocks(blocks.filter((b) => b.type !== "h2" && b.type !== "title"));
  write("foreword.md", `---
title: "Hope amidst vulnerability"
subtitle: "Foreword by Nico Koopman"
date-modified: last-modified
---

${body}`);
}

// ---- Introduction essay (PDF pp. 17–35)
console.log("Introduction");
{
  const blocks = buildBlocks(17, 35, { log: true });
  // the author line "Johan Fourie1 and Laura Richardson2" is Gudea 10 and was
  // dropped by the classifier; footnotes 1 and 2 are the affiliations.
  const body = renderBlocks(blocks.filter((b) => b.type !== "title"));
  write("introduction.md", `---
title: "Introduction"
subtitle: "Life under Lockdown: the editors' essay"
date-modified: last-modified
---

::: {.byline}
Johan Fourie[^1] and Laura Richardson[^2]
:::

${body}`);
}

// ---- About this book: editors (p. 9), acknowledgements (pp. 10–11), cover art (p. 12)
console.log("About this book");
{
  const editors = renderBlocks(buildBlocks(9, 9).filter((b) => b.type === "para"));
  const ack = renderBlocks(buildBlocks(10, 11, { signatures: true }).filter((b) => b.type === "para" || b.type === "sig"));
  const art = renderBlocks(buildBlocks(12, 12, { signatures: true }).filter((b) => b.type === "para" || b.type === "sig"))
    .replace("Klara-Marie den Meijer", "Klara-Marie den Heijer");   // the print edition misspells the artist's name
  write("about-this-book.md", `---
title: "About this book"
date-modified: last-modified
---

## The editors

${editors}
## Acknowledgements

${ack}
## Cover art

![](images/cover.jpg){.book-cover fig-alt="Life under Lockdown cover: a grid of hand-painted coloured squares"}

${art}`);
}

// ---- Diary (PDF pp. 37–164)
console.log("Diary");
{
  const blocks = buildBlocks(37, 164, { contextFont: true });
  // split at the date headings
  const days = [];
  let cur = null;
  for (const b of blocks) {
    if (b.type === "h2" && /^\d{1,2} (March|April) 2020$/.test(b.text)) { cur = { date: b.text, blocks: [] }; days.push(cur); continue; }
    if (b.type === "title") continue;
    if (!cur) { console.warn("  !! block before first date:", b.type, (b.text || "").slice(0, 50)); continue; }
    if (b.type === "h2") { cur.blocks.push({ type: "para", text: `**${b.text}**` }); continue; }
    cur.blocks.push(b);
  }
  const MONTHS = { March: 3, April: 4 };
  const LOCKDOWN = Date.UTC(2020, 2, 27);
  const WD = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
  const words = ["", "one", "two", "three", "four", "five", "six"];
  let nSep = 0;
  for (const d of days) {
    const [dd, mon] = d.date.split(" ");
    const dt = Date.UTC(2020, MONTHS[mon] - 1, +dd);
    const diff = Math.round((dt - LOCKDOWN) / 86400000);
    let when;
    if (diff < 0) when = `${words[-diff]} day${-diff > 1 ? "s" : ""} before lockdown`;
    else when = `Day ${diff + 1} of lockdown`;
    const subtitle = `${WD[new Date(dt).getUTCDay()]} · ${when}`;
    // entries: context paragraph(s) first, then entries separated by sep blocks
    const seps = d.blocks.filter((b) => b.type === "sep").length;
    nSep += seps;
    const body = renderBlocks(d.blocks, { diary: true })
      // one known false paragraph break at a page turn (p. 145/146): the "19 reasons" list
      .replace("meal after 1:00 am.\n\n5\\. My dog", "meal after 1:00 am. 5. My dog");
    const file = `2020-${String(MONTHS[mon]).padStart(2, "0")}-${String(dd).padStart(2, "0")}.md`;
    d.file = file; d.entries = seps;
    write(file, `---
title: "${d.date}"
subtitle: "${subtitle}"
toc: false
date-modified: last-modified
---

${body}`);
  }
  console.log(`  days: ${days.length}, entries (separators): ${nSep}`);
  fs.writeFileSync(path.join(WORK, "days.json"), JSON.stringify(days.map((d) => ({ date: d.date, file: d.file, entries: d.entries })), null, 2));
  if (days.length !== 34) throw new Error(`expected 34 days, got ${days.length}`);
  if (nSep !== 335) throw new Error(`expected 335 entries, got ${nSep}`);
}

// ---- Blurbs (p. 7) for the landing page
{
  const blocks = buildBlocks(7, 7).filter((b) => b.type === "para");
  fs.writeFileSync(path.join(WORK, "blurbs.md"), blocks.map((b) => b.text.replace(/\*\*/g, "")).join("\n\n"), utf8);
  fs.writeFileSync(path.join(WORK, "hyphens.log"), hyphenLog.join("\n"), utf8);
  console.log("  wrote _work/blurbs.md");
}
console.log("done");
