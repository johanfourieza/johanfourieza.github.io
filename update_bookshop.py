"""
update_bookshop.py  –  Sync the Bookshop gallery from the Excel spreadsheet.

Usage:
    python update_bookshop.py

Reads Johan_bookshop.xlsx, generates the JavaScript BOOKS array,
and patches bookshop.qmd in place. Then just render and push:

    quarto render bookshop.qmd
    git add bookshop.qmd docs/bookshop.html && git commit -m "Update bookshop" && git push
"""

import re
from pathlib import Path

try:
    import openpyxl
except ImportError:
    print("openpyxl is required.  Install it with:  pip install openpyxl")
    raise SystemExit(1)

ROOT = Path(__file__).parent
EXCEL = ROOT / "Johan_bookshop.xlsx"
QMD   = ROOT / "bookshop.qmd"

# ── Read Excel ────────────────────────────────────────────────
wb = openpyxl.load_workbook(EXCEL, read_only=True)
ws = wb.active

rows = list(ws.iter_rows(min_row=2, values_only=True))
wb.close()

books = []
for row in rows:
    title  = str(row[0] or "").strip()
    author = str(row[1] or "").strip()
    url    = str(row[2] or "").strip()
    asin   = str(row[3] or "").strip()
    notes  = str(row[4] or "").strip()

    if not title:
        continue

    # Excel stores numeric ASINs as numbers, stripping leading zeros.
    # ASINs are always 10 characters; pad with leading zeros if needed.
    if asin and not asin[-1].isalpha():
        asin = asin.zfill(10)

    books.append(dict(title=title, author=author, url=url, asin=asin, notes=notes))

print(f"Read {len(books)} books from {EXCEL.name}")

# ── Generate JavaScript array ─────────────────────────────────
def js_string(s):
    """Escape a Python string for use inside JS double quotes."""
    return s.replace("\\", "\\\\").replace('"', '\\"')

lines = ["var BOOKS = ["]
for i, b in enumerate(books):
    comma = "," if i < len(books) - 1 else ""
    lines.append("  {")
    lines.append(f'    title:  "{js_string(b["title"])}",')
    lines.append(f'    author: "{js_string(b["author"])}",')
    lines.append(f'    url:    "{js_string(b["url"])}",')
    lines.append(f'    asin:   "{js_string(b["asin"])}",')
    lines.append(f'    notes:  "{js_string(b["notes"])}"')
    lines.append("  }" + comma)
lines.append("];")

new_array = "\n".join(lines)

# ── Patch bookshop.qmd ───────────────────────────────────────
qmd_text = QMD.read_text(encoding="utf-8")

pattern = re.compile(
    r"var BOOKS = \[.*?\];",
    re.DOTALL,
)

if not pattern.search(qmd_text):
    print("ERROR: Could not find 'var BOOKS = [...];' in bookshop.qmd")
    raise SystemExit(1)

new_text = pattern.sub(new_array, qmd_text)
QMD.write_text(new_text, encoding="utf-8")

print(f"Updated {QMD.name} with {len(books)} books.")
print("\nNext steps:")
print("  quarto render bookshop.qmd")
print("  git add bookshop.qmd docs/bookshop.html && git commit -m \"Update bookshop\" && git push")
