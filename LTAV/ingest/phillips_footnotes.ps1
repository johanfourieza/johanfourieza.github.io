# Restores Howard Phillips' 10 footnotes to chapter 03. The compiled manuscript
# (TheBook.docx) and the printed 2009 edition both omitted them, but the author's
# anchored notes survive in "Laaste goed/Footnotes_Phillips.docx": each note names
# the exact phrase it attaches to. This injects [^1]..[^10] at those phrases and
# appends the definitions. Idempotent; safe to re-run (and run at the end of split.ps1).
#
# The anchor/note data lives in phillips_footnotes.json (UTF-8) so this script stays
# pure-ASCII -- PowerShell 5.1 otherwise mis-parses literal curly quotes/en-dashes.
#
# Run:  pwsh -File LTAV/ingest/phillips_footnotes.ps1
$ErrorActionPreference = "Stop"
$ltav = Split-Path -Parent $PSScriptRoot
$file = Join-Path $ltav "03-how-did-the-sa-university-develop.md"
$json = Join-Path $PSScriptRoot "phillips_footnotes.json"

$text  = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
$notes = [System.IO.File]::ReadAllText($json, [System.Text.Encoding]::UTF8) | ConvertFrom-Json

if ($text -match '(?m)^\[\^1\]:') { "Phillips footnotes already present - nothing to do."; return }

# Insert each [^N] immediately AFTER its (literal, unique) anchor phrase.
for ($i = 0; $i -lt $notes.Count; $i++) {
  $anchor = $notes[$i].a
  $count  = ([regex]::Matches($text, [regex]::Escape($anchor))).Count
  if ($count -ne 1) { throw "Anchor #$($i+1) matched $count times (expected 1): $anchor" }
  $text = $text.Replace($anchor, $anchor + "[^$($i+1)]")
  "anchored [^$($i+1)] after: $anchor"
}

$defs = for ($i = 0; $i -lt $notes.Count; $i++) { "[^$($i+1)]: $($notes[$i].n)" }
$text = $text.TrimEnd() + "`n`n" + ($defs -join "`n`n") + "`n"

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($file, $text, $utf8NoBom)
"DONE: 10 Phillips footnotes injected into $(Split-Path $file -Leaf)"
