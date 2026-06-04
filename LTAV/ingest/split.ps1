# Splits the converted TheBook.docx markdown (_work/book.md) into the 21
# content chapters of "Let's Talk About Varsity". Drops the Table of Contents,
# the "Manuscript" front block, and the three "Seven questions" interviews.
# Each chapter gets YAML frontmatter (title + contributor byline) and keeps the
# footnotes it references (pandoc collects all definitions at the document end).
#
# Run from anywhere:  pwsh -File LTAV/ingest/split.ps1
$ErrorActionPreference = "Stop"
$ltav = Split-Path -Parent $PSScriptRoot          # ...\Website\LTAV
$work = Join-Path $PSScriptRoot "_work"
$src  = [System.IO.File]::ReadAllText((Join-Path $work "book.md"), [System.Text.Encoding]::UTF8)
$lines = $src -replace "`r`n", "`n" -split "`n"

# First footnote-definition line marks the start of the trailing footnote block.
$fnStart = ($lines | Select-String -Pattern '^\[\^[^\]]+\]:' | Select-Object -First 1).LineNumber
# Build id -> definition text (defs are single-line here; capture continuations defensively).
$fn = @{}
for ($i = $fnStart - 1; $i -lt $lines.Count; $i++) {
  if ($lines[$i] -match '^\[\^([^\]]+)\]:') {
    $id = $matches[1]; $buf = $lines[$i]; $j = $i + 1
    while ($j -lt $lines.Count -and $lines[$j] -notmatch '^\[\^' -and $lines[$j].Trim() -ne '') { $buf += "`n" + $lines[$j]; $j++ }
    $fn[$id] = $buf
  }
}

# All level-1 headings in document order (1-based line numbers), to compute chapter ends.
$allStarts = @(75,176,212,294,362,401,433,478,521,560,643,694,791,898,1023,1067,1136,1223,1334,1667,1812,1881,1966,2005)

# The 21 content chapters to KEEP: start line, title, contributor, output filename.
$chapters = @(
  @{ s=75;   t='Why university?';                              a='Theuns Eloff';          f='01-why-university.md' },
  @{ s=212;  t='What is a university?';                        a='Anton van Niekerk';     f='02-what-is-a-university.md' },
  @{ s=362;  t='How did the South African university develop?';a='Howard Phillips';       f='03-how-did-the-sa-university-develop.md' },
  @{ s=401;  t='Social sciences, philosophy and theology';     a='Anton van Niekerk';     f='04-social-sciences-philosophy-theology.md' },
  @{ s=433;  t='Languages and the arts';                       a='T.T. Cloete';           f='05-languages-and-the-arts.md' },
  @{ s=478;  t='Education sciences';                           a='Jonathan Jansen';       f='06-education-sciences.md' },
  @{ s=521;  t='Management sciences';                          a='Eon Smit';              f='07-management-sciences.md' },
  @{ s=560;  t='Biological sciences';                          a='Eugene Cloete';         f='08-biological-sciences.md' },
  @{ s=643;  t='Agricultural sciences';                        a='Eugene Cloete';         f='09-agricultural-sciences.md' },
  @{ s=694;  t='Physical sciences';                            a='Eugene Cloete';         f='10-physical-sciences.md' },
  @{ s=791;  t='Engineering sciences';                         a='Arnold Schoonwinkel';   f='11-engineering-sciences.md' },
  @{ s=898;  t='Health sciences';                              a='Wynand van der Merwe';  f='12-health-sciences.md' },
  @{ s=1023; t='Law';                                          a='Marinus Wiechers';      f='13-law.md' },
  @{ s=1067; t='Sport sciences';                               a='Tim Noakes';            f='14-sport-sciences.md' },
  @{ s=1136; t='How do I choose a career?';                    a='Johann Meyer';          f='15-how-to-choose-a-career.md' },
  @{ s=1223; t="Fishing and dancing? It`u{2019}s a question of balance"; a='Ruda Landman'; f='16-finding-the-right-balance.md' },
  @{ s=1334; t='An investment in your future';                 a='Estian Calitz';         f='17-balancing-your-budget.md' },
  @{ s=1667; t='How to cope with diversity';                   a='Nico Koopman';          f='18-coping-with-diversity.md' },
  @{ s=1812; t='Why you should take the lead';                 a='Joseph Diescho';        f='19-taking-the-lead.md' },
  @{ s=1881; t='Understanding our globalised world';           a='Willie Esterhuyse';     f='20-understanding-our-globalised-world.md' },
  @{ s=2005; t='Why your world needs you';                     a='Stef Coetzee';          f='21-how-you-can-make-a-difference.md' }
)

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
foreach ($c in $chapters) {
  # End = line before the next level-1 heading; last chapter ends before the footnote block.
  $nextIdx = [Array]::IndexOf($allStarts, $c.s) + 1
  $end = if ($nextIdx -lt $allStarts.Count) { $allStarts[$nextIdx] - 1 } else { $fnStart - 1 }
  $body = $lines[($c.s - 1)..($end - 1)]

  # Drop the H1 title line.
  $body = $body[1..($body.Count - 1)]
  # Drop the contributor byline. Some bylines carry an acknowledgement footnote
  # ("Eugene Cloete[^15]"); match the name loosely and preserve that footnote.
  $k = 0; while ($k -lt $body.Count -and $body[$k].Trim() -eq '') { $k++ }
  $carryFn = $null
  if ($k -lt $body.Count) {
    $ln = $body[$k].Trim(); $nameOnly = $ln; $ref = $null
    if ($ln -match '^(.*?)\s*(\[\^[^\]]+\])\s*$') { $nameOnly = $matches[1].Trim(); $ref = $matches[2] }
    if (($nameOnly -replace '[^\p{L}]','').ToLower() -eq ($c.a -replace '[^\p{L}]','').ToLower()) {
      $carryFn = $ref
      $before = if ($k -gt 0) { $body[0..($k-1)] } else { @() }
      $after  = if ($k -lt $body.Count - 1) { $body[($k+1)..($body.Count-1)] } else { @() }
      $body = @($before) + @($after)
    }
  }
  while ($body.Count -gt 0 -and $body[0].Trim() -eq '') { $body = $body[1..($body.Count - 1)] }
  # Re-anchor a byline acknowledgement footnote to the first prose paragraph
  # (skip headings, so it never lands on a "## ..." line).
  if ($carryFn) {
    $placed = $false
    for ($m = 0; $m -lt $body.Count; $m++) { if ($body[$m].Trim() -ne '' -and $body[$m] -notmatch '^\s*#') { $body[$m] = $body[$m].TrimEnd() + $carryFn; $placed = $true; break } }
    if (-not $placed) { for ($m = 0; $m -lt $body.Count; $m++) { if ($body[$m].Trim() -ne '') { $body[$m] = $body[$m].TrimEnd() + $carryFn; break } } }
  }

  # ch21 contains a second H1 ("South Africa and a globalised world"): demote all headings one level.
  if (($body | Where-Object { $_ -match '^# ' }).Count -gt 0) {
    $body = $body | ForEach-Object { if ($_ -match '^#{1,5} ') { '#' + $_ } else { $_ } }
  }

  # Strip the part-divider page that trails the last chapter of each part
  # (blank lines, stray "*\"/"**" runs, and the "2.  Making the Right Choice" list item).
  $divider = '^\s*$|^\*+\\?\s*$|^\\\s*$|^\d+\.\s+Making\b'
  while ($body.Count -gt 0 -and $body[-1] -match $divider) { $body = $body[0..($body.Count - 2)] }

  $text = ($body -join "`n").TrimEnd()

  # Append the footnote definitions this chapter references, in numeric order.
  $ids = [regex]::Matches($text, '\[\^([^\]]+)\](?!:)') | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique
  if ($ids) {
    $sorted = $ids | Sort-Object { [int]($_ -replace '\D','0') }
    $defs = foreach ($id in $sorted) { if ($fn.ContainsKey($id)) { $fn[$id] } }
    if ($defs) { $text += "`n`n" + ($defs -join "`n`n") }
  }

  $title = $c.t -replace '"','\"'
  $fm = "---`ntitle: `"$title`"`nsubtitle: `"$($c.a)`"`ndate-modified: last-modified`n---`n`n"
  $out = Join-Path $ltav $c.f
  [System.IO.File]::WriteAllText($out, $fm + $text + "`n", $utf8NoBom)
  "{0,-44} {1,5} lines  fn:[{2}]" -f $c.f, $body.Count, ($sorted -join ',')
}
"DONE: $($chapters.Count) chapters written to $ltav"

# Restore Howard Phillips' anchored footnotes to chapter 03 (absent from TheBook.docx).
& (Join-Path $PSScriptRoot "phillips_footnotes.ps1")
