// Step 1 of the LUL ingest pipeline: dump every text run in the publisher's
// typeset PDF with its position, size and font (so italics, bold, footnote
// markers and footnote bodies can be told apart downstream).
//
//   node LUL/ingest/extract.mjs            -> LUL/ingest/_work/runs.jsonl
//
// Each output line: {page, x, y, w, h, size, font, italic, bold, str}
// where y is measured from the top of the page (pdf.js uses bottom-left).
import { createRequire } from "node:module";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

const here = path.dirname(fileURLToPath(import.meta.url));
const require = createRequire(import.meta.url);
const pdfjs = await import(pathToFileURL(require.resolve("pdfjs-dist/legacy/build/pdf.mjs")).href);

const SRC = path.join(here, "_source", "Life under Lockdown_Text.pdf");
const OUT = path.join(here, "_work", "runs.jsonl");
fs.mkdirSync(path.dirname(OUT), { recursive: true });

const data = new Uint8Array(fs.readFileSync(SRC));
const doc = await pdfjs.getDocument({ data, useSystemFonts: true }).promise;
const out = fs.createWriteStream(OUT, { encoding: "utf8" });
const fontNames = new Set();

for (let p = 1; p <= doc.numPages; p++) {
  const page = await doc.getPage(p);
  const vp = page.getViewport({ scale: 1 });
  await page.getOperatorList();   // loads the fonts into page.commonObjs
  const tc = await page.getTextContent({ includeMarkedContent: false });
  // Resolve the internal font ids (g_d0_f1 …) to real font names.
  const names = {};
  for (const it of tc.items) {
    if (!it.fontName || names[it.fontName]) continue;
    try {
      const f = page.commonObjs.get(it.fontName);
      names[it.fontName] = (f && f.name) || (tc.styles[it.fontName] || {}).fontFamily || it.fontName;
    } catch { names[it.fontName] = it.fontName; }
  }
  for (const it of tc.items) {
    if (it.str === undefined) continue;
    const [a, b, c, d, e, f] = it.transform;
    const size = Math.hypot(c, d) || Math.abs(d);
    const name = names[it.fontName] || it.fontName;
    fontNames.add(name);
    const low = name.toLowerCase();
    out.write(JSON.stringify({
      page: p,
      x: +e.toFixed(2),
      y: +(vp.height - f).toFixed(2),
      w: +it.width.toFixed(2),
      h: +it.height.toFixed(2),
      size: +size.toFixed(2),
      font: name,
      italic: /italic|oblique/.test(low),
      bold: /bold|semibold|black/.test(low),
      eol: !!it.hasEOL,
      str: it.str,
    }) + "\n");
  }
  if (p % 20 === 0) console.log(`page ${p}/${doc.numPages}`);
}
out.end();
console.log(`pages: ${doc.numPages}`);
console.log("fonts:", [...fontNames].join(", "));
console.log(`-> ${OUT}`);
