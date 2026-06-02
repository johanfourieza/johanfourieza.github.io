# johanfourie.com

Source for **[johanfourie.com](https://www.johanfourie.com)** — the personal site of
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
| `bookshop.qmd` | Bookshop | Affiliate gallery — see [`README_bookshop.md`](README_bookshop.md) |
| `OLWTEF/` | **The book** | *Our Long Walk to Economic Freedom*, free online edition |

Shared identity lives in `styles.css` and `_quarto.yml` (brown `#693e23`, olive `#8f8844`,
cream `#f7f5f2`, Inter). Output is built into `docs/` and committed.

---

## *Our Long Walk to Economic Freedom* — the living book

`OLWTEF/` is a **Quarto book** (its own `_quarto.yml`, `project: type: book`) that renders to
`docs/OLWTEF/` and is served at **johanfourie.com/OLWTEF**. It is the full 37-chapter revised
second edition, free to read online.

- **Read-online-only by design.** HTML is the only format — no PDF/EPUB is generated, so there
  is nothing to download. `readonly.html` adds light deterrents and `theme.scss` blanks the page
  on print. `index.qmd` carries the licence notice. (HTML text can never be fully locked; the
  real safeguard is offering no downloadable file.)
- **References** are the book's own footnotes/endnotes (per chapter). `references.bib` is shared
  with the site and reserved for future living-edition citations.
- **Figures**: 23 charts/maps, all in the Our Long Walk house style (`/olwstyle`), in colour.

### Folder layout

```
OLWTEF/
├── _quarto.yml            book project (html-only, output ../docs/OLWTEF)
├── theme.scss             OLW/site palette for the book
├── readonly.html          read-only deterrents (include-after-body)
├── index.qmd              landing page (blurb, how-to-read, how-to-cite, licence)
├── praise.md, a-note-on-sources.md, about-the-author.md   front matter
├── 00-introduction.md … 38-epilogue.md   the chapters
├── images/                cover, icon, figure-X-Y.jpg (the 23 figures)
├── _data.yml              per-chapter sources/datasets (for the future linking layer)
├── .obsidian/             vault config — this folder doubles as an Obsidian vault
├── _authoring.md          day-to-day authoring guide (Quarto-ignored, Obsidian-visible)
└── ingest/                the reproducible build pipeline (below)
```

### Authoring workflow (day to day)

1. Open `OLWTEF/` as an **Obsidian vault**; edit the chapter `.md` files.
2. `git push`. The GitHub Action **rebuilds the book and republishes** — no local render needed.
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
| `clean_markdown.R` | strip Word index markers and stray page numbers |
| `wire_figures.R` | insert each `figure-X-Y` image + caption at its place in the text |
| `olw_figures.R` | **canonical figure builder** — draws all 23 figures in `/olwstyle` colour from `OLWEF/Data` (+ `rnaturalearth` basemaps) into `images/` |
| `regen_figures.R`, `regen_remaining.R` | earlier figure builders, superseded by `olw_figures.R` |

Pipeline order: `convert → split → clean → wire`, with `olw_figures.R` producing the figures.

Four figures had no original R source and were **rebuilt from scratch** in `olw_figures.R`:
the Jerusalem timeline (9.1), the Atlantic slave routes (12.1), the norms-via-migration
schematic (3.1), and Africa's ecological zones (8.1, a stylised approximation).

Figure captions follow `/olwstyle`: `Source: … • Visualised: johanfourie.com`.

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
OLWTEF vault — rebuild and push the book,"* or *"add a new figure to chapter 20 in /olwstyle."*
