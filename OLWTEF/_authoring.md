# Authoring guide — *Our Long Walk to Economic Freedom* (living edition)

This folder is **both** a Quarto book project and an Obsidian vault. Files starting with
`_` (like this one) are ignored by Quarto but visible in Obsidian.

## Daily workflow
1. Open this `OLWTEF/` folder as a vault in Obsidian.
2. Edit chapters (`01-introduction.md`, `02-…md`, …) as plain markdown.
3. Cite with pandoc keys: `[@citekey]`. Keys live in `../references.bib` (shared with the
   website). Add new sources there, with a `doi` or `url` field so they link out.
4. Record each chapter's papers/datasets in `_data.yml` → these become the
   "Sources & data" box at the end of the chapter.
5. `git push`. The GitHub Action rebuilds the book and publishes it. No local render needed.

## Local preview (optional)
From the `Website/` folder:
```
quarto preview OLWTEF
```
(On this machine Quarto ships with RStudio:
`C:\Program Files\RStudio\resources\app\bin\quarto\bin\quarto.exe`.)

## Recommended Obsidian community plugins
- **Citations** (or **Pandoc Reference List**) — point it at `../references.bib` so `@keys`
  autocomplete and resolve while you write.

## House conventions
- Figures: `![Caption.](images/name.png){#fig-slug}` and refer back with `@fig-slug`.
- Margin notes / source asides: wrap in a `::: {.column-margin}` … `:::` block.
- Chapter end: a `## Sources & data {.sources-block}` heading (generated from `_data.yml`).
- Do **not** add a `pdf`/`epub` format — the edition is read-online-only by design.
