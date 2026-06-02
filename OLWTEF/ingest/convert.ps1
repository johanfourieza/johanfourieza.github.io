<#
.SYNOPSIS
  Convert the Word manuscript of "Our Long Walk to Economic Freedom" into clean
  per-chapter Quarto markdown, extracting figures into OLWTEF/images/.

.DESCRIPTION
  Run once (and re-run whenever the source Word files change). For each .docx it
  produces a NN-<slug>.md chapter file using pandoc, with images extracted and
  line wrapping disabled (so diffs stay clean in git/Obsidian).

  Two layouts are supported:
    * One .docx per chapter  -> pass -Source <folder>  (recommended)
    * One combined .docx      -> pass -Source <file>; pandoc cannot split markdown
      by heading, so the script emits a single 00-manuscript.md you then split by
      H1 (one per chapter). Per-chapter files are strongly preferred.

  After conversion, review each file: check heading levels (chapter title should be
  the H1 / front-matter title), convert images to Quarto figure syntax
  (![Caption](images/x.png){#fig-slug}), and verify footnotes/citations.

.EXAMPLE
  pwsh OLWTEF/ingest/convert.ps1 -Source "C:\path\to\OLWTEF-chapters"

.EXAMPLE
  pwsh OLWTEF/ingest/convert.ps1 -Source "C:\path\to\OLWTEF-chapters" -StartIndex 1
#>
param(
  [Parameter(Mandatory = $true)]
  [string]$Source,                          # folder of .docx, or a single .docx
  [int]$StartIndex = 1,                      # first chapter number
  [string]$OutDir = (Join-Path $PSScriptRoot ".."),   # OLWTEF/
  [string]$ImageDir = "images"
)

$ErrorActionPreference = "Stop"
$pandoc = (Get-Command pandoc -ErrorAction SilentlyContinue).Source
if (-not $pandoc) { throw "pandoc not found on PATH. Install pandoc (>=3) and retry." }

$OutDir = (Resolve-Path $OutDir).Path

function Convert-One {
  param([string]$DocxPath, [int]$Index)

  $base = [System.IO.Path]::GetFileNameWithoutExtension($DocxPath)
  $slug = ($base -replace '[^A-Za-z0-9]+', '-').Trim('-').ToLower()
  $num  = '{0:D2}' -f $Index
  $outName = "$num-$slug.md"
  $outPath = Join-Path $OutDir $outName

  Write-Host "[$num] $base  ->  $outName"

  # --extract-media drops images into OLWTEF/ (under $ImageDir); --wrap=none keeps
  # one paragraph per line for clean diffs; markdown = pandoc's extended markdown.
  & $pandoc $DocxPath `
      -f docx `
      -t markdown `
      --wrap=none `
      --markdown-headings=atx `
      --extract-media="$OutDir" `
      -o "$outPath"

  # Prepend a Quarto front-matter title (chapter name = the file's base name for now;
  # edit after review). Keeps the sidebar label tidy.
  $body  = Get-Content -Raw -Encoding UTF8 $outPath
  $title = ($base -replace '^\d+[\s\-_.]*', '')          # strip any leading number
  $fm = "---`ntitle: `"$title`"`ndate-modified: last-modified`n---`n`n"
  Set-Content -Path $outPath -Value ($fm + $body) -Encoding UTF8
}

if (Test-Path $Source -PathType Container) {
  $files = Get-ChildItem -Path $Source -Filter *.docx | Sort-Object Name
  if (-not $files) { throw "No .docx files found in $Source" }
  $i = $StartIndex
  foreach ($f in $files) { Convert-One -DocxPath $f.FullName -Index $i; $i++ }
  Write-Host "`nConverted $($files.Count) chapter(s). Now: review files, fix figures,"
  Write-Host "and add them under 'chapters:' in OLWTEF/_quarto.yml."
}
elseif (Test-Path $Source -PathType Leaf) {
  Convert-One -DocxPath $Source -Index 0
  Write-Host "`nSingle file converted to 00-*.md. Split it by H1 into per-chapter files."
}
else { throw "Source not found: $Source" }
