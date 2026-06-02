# johanfourie.com

Source for **[johanfourie.com](https://www.johanfourie.com)** – the personal site of
Johan Fourie, Professor of Economics at Stellenbosch University. It is a
[Quarto](https://quarto.org) website published to **GitHub Pages from the `docs/` folder**
(custom domain via `CNAME`).

## Site structure

| Source | Page | Notes |
|---|---|---|
| `index.qmd` | Home | Bio + live Our Long Walk Substack feed |
| `research.qmd` | Research | |
| `students.qmd` | Students | |
| `teaching.qmd` | Teaching | |
| `public.qmd` | Public | |
| `books.qmd` | **Read** | Hub linking to the free online books (see below) |
| `econtools.qmd` | Tools | |
| `bookshop.qmd` | Bookshop | Affiliate gallery – see [`README_bookshop.md`](README_bookshop.md) |
| `OLWTEF/` | **The book** | *Our Long Walk to Economic Freedom*, free online edition |

Shared identity lives in `styles.css` and `_quarto.yml` (brown `#693e23`, olive `#8f8844`,
cream `#f7f5f2`, Inter). Output is built into `docs/` and committed.

---

## *Our Long Walk to Economic Freedom* – the living book

`OLWTEF/` is a **Quarto book** (its own `_quarto.yml`, `project: type: book`) that renders to
`docs/OLWTEF/` and is served at **johanfourie.com/OLWTEF**. It is the full 37-chapter revised
second edition, free to read online.

- **Read-online-only by design.** HTML is the only format – no PDF/EPUB is generated, so there
  is nothing to download. `readonly.html` adds light deterrents and `theme.scss` blanks the page
  on print. `index.qmd` carries the licence notice. (HTML text can never be fully locked; the
  real safeguard is offering no downloadable file.)
- **References** are the book's own footnotes/endnotes (per chapter). `references.bib` is shared
  with the site and reserved for future living-edition citations.
- **Figures**: 23 charts/maps, all in the Our Long Walk house style (`/olwstyle`), in colour.
- **Landing page** carries a banner of all five editions (first edition, Cambridge/CUP,
  Afrikaans *Skatryk*, isiXhosa *Izinhanha*, revised second edition); the footer links back to
  johanfourie.com (there is no separate "About the author" page).
- **House style – en-dashes only, never em-dashes.** This is a hard rule; it is enforced in the
  ingest pipeline (`clean_markdown.R` normalises any em-dash to a spaced en-dash). Figure
  captions read `Source: … • Visualised: johanfourie.com`.

### Folder layout

```
OLWTEF/
├── _quarto.yml            book project (html-only, output ../docs/OLWTEF)
├── theme.scss             OLW/site palette for the book
├── readonly.html          read-only deterrents (include-after-body)
├── index.qmd              landing page: editions-cover banner, how-to-read, how-to-cite, licence
├── praise.md, a-note-on-sources.md   front matter
├── 00-introduction.md … 38-epilogue.md   the chapters
├── images/                icon, the 23 figure-X-Y.jpg, and the edition covers (ed-*.jpg)
├── _data.yml              per-chapter sources/datasets (drives the linking layer; see Next steps)
├── .obsidian/             vault config – this folder doubles as an Obsidian vault
├── _authoring.md          day-to-day authoring guide (Quarto-ignored, Obsidian-visible)
└── ingest/                the reproducible build pipeline (below)
```

### Authoring workflow (day to day)

1. Open `OLWTEF/` as an **Obsidian vault**; edit the chapter `.md` files.
2. `git push`. The GitHub Action **rebuilds the book and republishes** – no local render needed.
3. Local preview if wanted: `quarto preview OLWTEF`.

See `OLWTEF/_authoring.md` for the full guide.

### How the book was built (reproducible pipeline)

The manuscript and data live **outside this repo** in `…/4JohanFourie/OLWEF/`
(`Manuscript_firstbatch.docx` + `Manuscript_secondbatch.docx`, `Data/`, `Graphs/`). The
`OLWTEF/ingest/` scripts turn that source into the book and are safe to re-run:

| Script | Does |
|---|---|
| `convert.ps1` | pandoc each Word batch → markdown |
| `split.R` | split into intro + 37 chapters + epilogue (anchored on the chapter titles; carries each chapter's footnotes; hard-fails unless all 37 are found) |
| `clean_markdown.R` | strip Word index markers and stray page numbers; normalise em-dashes to en-dashes (house rule) |
| `wire_figures.R` | insert each `figure-X-Y` image + caption at its place in the text |
| `olw_figures.R` | **canonical figure builder** – draws all 23 figures in `/olwstyle` colour from `OLWEF/Data` (+ `rnaturalearth` basemaps) into `images/` |
| `regen_figures.R`, `regen_remaining.R` | earlier figure builders, superseded by `olw_figures.R` |

Pipeline order: `convert → split → clean → wire`, with `olw_figures.R` producing the figures.

Four figures had no original R source and were **rebuilt from scratch** in `olw_figures.R`:
the Jerusalem timeline (9.1), the Atlantic slave routes (12.1), the norms-via-migration
schematic (3.1), and Africa's ecological zones (8.1, a stylised approximation).

Figure captions follow `/olwstyle`: `Source: … • Visualised: johanfourie.com`.

---

## Next steps (roadmap)

The book is published and in the house style. These are the changes we plan to make next,
roughly in priority order. The first two are the focus, and some of the plumbing for them is
already in place.

### 1. Scholarly linking layer – connect the text to the evidence
The goal is that a student can jump from any claim in the book straight to the original research
and the data behind it.

- **Link the footnotes to their sources.** The roughly 370 endnotes are currently plain
  references. Add a DOI or stable URL (journal, SSRN/RePEc, or working-paper page) to each one so
  a reader reaches the original paper in a single click. This is done incrementally, chapter by
  chapter, enriching `references.bib` as we go.
- **Per-chapter "Sources & data" blocks.** Each chapter ends with a box (the `.sources-block`
  style already exists in `theme.scss`) that lists the papers behind that chapter and links the
  **datasets and replication code on GitHub** (github.com/johanfourieza). These are generated from
  `OLWTEF/_data.yml`, so they stay easy to keep current as the book grows.
- **A central "Data & sources" index** page mapping chapter → papers → datasets.
- **"Cite this version" + a Zenodo DOI**, so the living book has citable, archival snapshots and
  each meaningful update can carry its own versioned DOI.

### 2. Class annotation layer – for Economics 281
- Switch on **Hypothes.is** (the configuration is already stubbed in `OLWTEF/_quarto.yml`) with a
  **private class group**, so students can highlight, annotate and discuss in the margins. This
  turns the book into a shared seminar surface rather than a static text.

### 3. Keep it living
- Update chapters as new research appears – the whole point of a "living" edition – and add a
  short **"What's new" / changelog** page so returning readers can see what has changed.

### Later / exploratory
- **"Ask the book" assistant** – a retrieval-augmented chat over the text that answers student
  questions with citations to the relevant chapters. It needs a small serverless endpoint and an
  API key (so it is not pure-static); planned as an opt-in add-on.
- **Interactive figures** (Observable / Quarto Live) for a few key charts.
- **Multilingual editions** (English and Afrikaans) via Quarto profiles.
- **Figure 8.1** redrawn from a proper ecoregion shapefile (it is currently a stylised
  approximation of Africa's biome boundaries).
- **Slides on demand** – generate reveal.js slides per chapter with Claude Code at teaching time,
  rather than maintaining a separate deck.

---

## Building & deploying

- **Quarto** is bundled with RStudio on the author's machine
  (`C:\Program Files\RStudio\resources\app\bin\quarto\bin\quarto.exe`); `pandoc` and `R 4.5`
  are also used by the ingest scripts.
- **Deploy:** `docs/` is committed and served by GitHub Pages. The book also rebuilds in CI:
  `.github/workflows/publish.yml` runs `quarto render OLWTEF` on any push that touches
  `OLWTEF/**` or `references.bib`, and commits the refreshed `docs/OLWTEF/`.
- **Local full-site render note:** on the Dropbox-synced working copy, a full `quarto render`
  can hit file locks on `docs/`. Workarounds: render a single file (`quarto render <page>.qmd`),
  let the Linux GitHub Action do the clean build, or render into a temp folder outside Dropbox
  and copy `docs/OLWTEF` back.

## Using Claude Code

This site is maintained with Claude Code. For example: *"I've revised chapter 12 in the
OLWTEF vault – rebuild and push the book,"* or *"add a new figure to chapter 20 in /olwstyle."*
