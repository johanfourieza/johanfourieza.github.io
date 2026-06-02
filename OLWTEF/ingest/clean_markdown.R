# Idempotent cleanup of ingested chapter markdown (run AFTER split.R, BEFORE wire_figures.R):
#  - strip Word index markers: [word]{.indexref entry="..."} (empty or word-wrapping,
#    often stacked/nested) -> keep any inner word, drop the marker; looped until stable
#  - drop noise lines: stray page numbers (a lone 1-3 digit line) and unicode-space-only lines
#  - collapse runs of blank lines
# Safe to re-run.

# Dropbox on this machine intermittently locks files mid-write ("Invalid argument").
# Retry writes a few times so one pass completes reliably.
safe_write <- function(lines, path, tries = 6) {
  for (t in seq_len(tries)) {
    ok <- tryCatch({ con <- file(path, "w", encoding = "UTF-8"); writeLines(lines, con); close(con); TRUE },
                   error = function(e) FALSE)
    if (ok) return(invisible(TRUE))
    Sys.sleep(0.5)
  }
  stop("could not write ", path)
}

files <- list.files("OLWTEF", pattern = "^[0-9][0-9]-.*\\.md$", full.names = TRUE)
# Explicit list of unicode space chars (NO ranges -- a literal '-' here would create a
# giant range and blank the text). Hyphen intentionally absent.
uspace <- "[     ​  　﻿]"

stripped <- 0L; dropped <- 0L
for (path in files) {
  L <- readLines(file(path, encoding = "UTF-8"), warn = FALSE)
  stripped <- stripped + sum(unlist(gregexpr("\\.indexref", L)) > 0)
  repeat {                                                 # collapse nested markers, keep inner text
    before <- L
    L <- gsub("\\[([^][]*)\\]\\{\\.indexref[^}]*\\}", "\\1", L)
    if (identical(L, before)) break
  }
  L <- gsub(uspace, " ", L)                               # normalise odd spaces
  # HOUSE RULE: never em-dashes. Convert em-dash (U+2014) and pandoc/inline triple-hyphen
  # to a spaced en-dash (U+2013). YAML/HR fence lines ("---" alone) are left untouched.
  L <- gsub("\\s*—\\s*", " – ", L)
  fence <- grepl("^\\s*-{3,}\\s*$", L)
  L[!fence] <- gsub("\\s*-{3}\\s*", " – ", L[!fence])
  is_noise <- grepl("^\\s*[0-9]{1,3}\\s*$", L)            # lone page numbers
  dropped <- dropped + sum(is_noise)
  L <- L[!is_noise]
  blank <- L == "" | grepl("^[[:space:]]+$", L)          # collapse blank runs
  keep <- !(blank & c(FALSE, head(blank, -1)))
  L <- L[keep]
  safe_write(L, path)
}
cat("Stripped", stripped, "index markers; dropped", dropped, "noise lines.\n")
