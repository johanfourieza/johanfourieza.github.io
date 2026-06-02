# Regenerate book figures from the author's ScriptGraphs.R, robustly:
#  - runs each "###FIGURE n" block in isolation (try); a failing block is skipped
#    so its figure can fall back to the curated Graphs/JPG set downstream
#  - shadows ggsave() to write into a temp _regen dir (never overwrites originals)
#  - loads only packages that are actually installed
# Outputs raw files (figure1.jpg, figure23a.jpg, ...) into <OLWEF>/Graphs/_regen/.

OLWEF <- "C:/Users/johanf/Dropbox/0Claude0/4JohanFourie/OLWEF"
OUTDIR <- file.path(OLWEF, "Graphs", "_regen")
dir.create(OUTDIR, showWarnings = FALSE, recursive = TRUE)
setwd(OLWEF)

libs <- c("tidyverse","data.table","reshape2","RColorBrewer","readxl","scales",
          "ggrepel","ggpubr","sf","rnaturalearth","rnaturalearthdata","igraph",
          "zoo","janitor","gridExtra","stringr","grid")
for (p in libs) try(suppressWarnings(suppressMessages(library(p, character.only = TRUE))), silent = TRUE)

# redirect every ggsave into OUTDIR by basename
ggsave <- function(filename, ...) ggplot2::ggsave(file.path(OUTDIR, basename(filename)), ...)

src <- readLines(file.path(OLWEF, "Graphs", "ScriptGraphs.R"), encoding = "UTF-8", warn = FALSE)
starts <- grep("^#+\\s*(FIGURE|CHAPTER)\\b", src, ignore.case = TRUE)
cat("Found", length(starts), "figure blocks.\n\n")

ok <- character(0); fail <- character(0)
for (i in seq_along(starts)) {
  from <- starts[i]
  to   <- if (i < length(starts)) starts[i + 1] - 1 else length(src)
  label <- trimws(sub("^#+\\s*", "", src[from]))
  before <- list.files(OUTDIR)
  res <- try(eval(parse(text = paste(src[from:to], collapse = "\n")),
                   envir = globalenv()), silent = TRUE)
  after <- setdiff(list.files(OUTDIR), before)
  if (inherits(res, "try-error") && !length(after)) {
    fail <- c(fail, label)
    cat(sprintf("  FAIL  %-16s %s\n", label, sub("\n.*", "", conditionMessage(attr(res, "condition")))))
  } else {
    ok <- c(ok, after)
    cat(sprintf("  ok    %-16s -> %s\n", label, paste(after, collapse = ", ")))
  }
}
cat("\nRegenerated files:\n  ", paste(sort(list.files(OUTDIR)), collapse = "\n   "), "\n")
