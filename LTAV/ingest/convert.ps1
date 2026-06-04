# Step 1 of the LTAV ingest pipeline: convert the compiled Word manuscript and
# the front/back matter to markdown with Quarto's bundled pandoc. Step 2 is
# split.ps1, which carves _work/book.md into the 21 content chapters.
#
# Source of truth: the final compiled manuscript "TheBook.docx" (May 2009) plus
# the later "Preface_revised (3).docx" and "Authorsbio.docx".
#
# Run:  pwsh -File LTAV/ingest/convert.ps1
$ErrorActionPreference = "Stop"
$env:Path += ";C:\Users\johanf\AppData\Local\Programs\Quarto\bin\tools"   # bundled pandoc
$src  = "C:\Users\johanf\Dropbox\0Claude0\4JohanFourie\LTAV\Laaste goed"
$work = Join-Path $PSScriptRoot "_work"
New-Item -ItemType Directory -Force -Path $work | Out-Null

$common = @('-f','docx','-t','markdown-smart','--wrap=none','--markdown-headings=atx')
quarto pandoc "$src\TheBook.docx"             @common -o "$work\book.md"
quarto pandoc "$src\Preface_revised (3).docx" @common -o "$work\preface.md"
quarto pandoc "$src\Authorsbio.docx"          @common -o "$work\authorsbio.md"

"Converted -> $work :"
Get-ChildItem $work -Filter *.md | ForEach-Object { "  {0}  ({1:N0} bytes)" -f $_.Name, $_.Length }
"Next: pwsh -File LTAV/ingest/split.ps1"
