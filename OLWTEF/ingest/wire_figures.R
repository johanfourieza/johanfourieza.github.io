# Insert figure images at each "Figure X.Y <caption>" paragraph in the chapter files.
# - caption paragraphs are short (<160 chars) lines starting "Figure N.M " with no footnote
#   marker (this excludes running-text sentences like "Figure 1.1 helps us to dream...")
# - resolves images/figure-X-Y.(jpg|png); writes a centred image + styled caption
# - removes the single stray embedded screenshot (media/imageN.png) from the manuscript

imgdir <- "OLWTEF/images"
files <- list.files("OLWTEF", pattern = "^[0-9][0-9]-.*\\.md$", full.names = TRUE)

# Retry writes around intermittent Dropbox file locks ("Invalid argument").
safe_write <- function(lines, path, tries = 6) {
  for (t in seq_len(tries)) {
    ok <- tryCatch({ con <- file(path, "w", encoding = "UTF-8"); writeLines(lines, con); close(con); TRUE },
                   error = function(e) FALSE)
    if (ok) return(invisible(TRUE))
    Sys.sleep(0.5)
  }
  stop("could not write ", path)
}

resolve_img <- function(x, y) {
  for (ext in c("jpg", "png")) {
    f <- sprintf("figure-%s-%s.%s", x, y, ext)
    if (file.exists(file.path(imgdir, f))) return(f)
  }
  NA_character_
}

total <- 0; missing <- character(0)
for (path in files) {
  L <- readLines(file(path, encoding = "UTF-8"), warn = FALSE)
  out <- character(0)
  for (ln in L) {
    if (grepl("media/image", ln, ignore.case = TRUE) && grepl("^!\\[", ln)) next  # drop screenshot
    m <- regmatches(ln, regexec("^Figure ([0-9]+)\\.([0-9]+)\\s+(.+)$", ln))[[1]]
    is_caption <- length(m) == 4 && nchar(ln) < 160 && !grepl("\\[\\^", ln)
    if (is_caption) {
      x <- m[2]; y <- m[3]
      img <- resolve_img(x, y)
      cap <- ln                                   # full "Figure X.Y ..." text
      alt <- gsub("\"", "'", m[4])
      if (is.na(img)) { missing <- c(missing, sprintf("%s.%s", x, y)); out <- c(out, ln); next }
      out <- c(out,
               sprintf("![](images/%s){.book-figure fig-alt=\"%s\"}", img, alt),
               "",
               sprintf("::: {.figure-caption}\n%s\n:::", cap))
      total <- total + 1
    } else {
      out <- c(out, ln)
    }
  }
  safe_write(out, path)
}
cat("Inserted", total, "figures.\n")
if (length(missing)) cat("MISSING images for:", paste(unique(missing), collapse=", "), "\n") else cat("All figure images resolved.\n")
