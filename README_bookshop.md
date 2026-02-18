# Bookshop Update Workflow

This documents how to update the Bookshop page on johanfourie.com.

## Overview

The bookshop gallery is driven by data in an Excel spreadsheet. A Python script reads the spreadsheet and patches the Quarto source file, which is then rendered to HTML and pushed to GitHub Pages.

```
Johan_bookshop.xlsx  -->  update_bookshop.py  -->  bookshop.qmd  -->  quarto render  -->  docs/bookshop.html
```

## Files

| File | Purpose |
|---|---|
| `Johan_bookshop.xlsx` | Source of truth for book data (not tracked in git) |
| `update_bookshop.py` | Script that reads the Excel file and patches `bookshop.qmd` |
| `bookshop.qmd` | Quarto source file containing the gallery HTML/JS/CSS |
| `docs/bookshop.html` | Rendered output served by GitHub Pages |

## Excel columns

The script expects the following columns in the first (active) sheet, starting from row 2 (row 1 is the header):

| Column | Field | Notes |
|---|---|---|
| A | Title | Book title (required) |
| B | Author | Author name |
| C | URL | Amazon affiliate link |
| D | ASIN | Amazon ASIN (used for cover image). Numeric ASINs are zero-padded to 10 characters. |
| E | Notes | Short description or review blurb |

Rows with an empty title are skipped.

## Steps to update

1. **Edit the Excel file** (`Johan_bookshop.xlsx`) -- add, remove, or modify books.

2. **Run the sync script:**
   ```
   python update_bookshop.py
   ```
   This patches the `var BOOKS = [...]` array inside `bookshop.qmd`.

3. **Render with Quarto:**
   ```
   quarto render bookshop.qmd
   ```
   This produces `docs/bookshop.html`.

4. **Commit and push:**
   ```
   git add bookshop.qmd docs/bookshop.html
   git commit -m "Update bookshop"
   git push
   ```

## Requirements

- Python 3 with `openpyxl` (`pip install openpyxl`)
- Quarto CLI

## Using Claude Code

You can also ask Claude Code to do this for you. Just say something like:

> I've updated the bookshop Excel file. Please run the update workflow.

Claude Code will run the Python script, render with Quarto, and can commit/push on request.
