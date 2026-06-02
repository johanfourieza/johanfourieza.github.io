# Split the two pandoc-converted manuscript batches into per-chapter markdown.
# - Anchors on the 37 canonical titles (+ intro, epilogue) via normalised matching.
# - Body heading = LAST normalised match (TOC entries carry a "N." number prefix and
#   therefore do NOT match the number-less canonical, so only the body heading matches;
#   intro/epilogue have no number, so last-occurrence disambiguates TOC vs body).
# - Carries only the footnotes each chapter actually references.
# - Validation gate: must locate every expected section or it stops.

work <- "OLWTEF/ingest/_work"
outdir <- "OLWTEF"

# canonical titles (number-less); batch 1 = intro + ch1-17, batch 2 = ch18-37 + epilogue
sections <- list(
  list(num="00", batch=1, title="How Do We Thrive? An Introduction"),
  list(num="01", batch=1, title="Who are the Architects of Wakanda? African Economic Historians and the Stories We Tell"),
  list(num="02", batch=1, title="What Happened at Blombos in 70,000 BCE? The Out-of-Africa Hypothesis and the Peopling of the World"),
  list(num="03", batch=1, title="Why are the Danes so Individualistic? The Neolithic Revolution"),
  list(num="04", batch=1, title="Who Built the Pyramids? Trade and the Rise of Cities"),
  list(num="05", batch=1, title="Why Does isiXhosa Have Clicks? The Bantu Expansion"),
  list(num="06", batch=1, title="How did Joseph and his Eleven Brothers Solve the Three Economic Problems? Custom and Command in the Ancient World"),
  list(num="07", batch=1, title="What do Charlemagne and King Zwelithini have in common? Feudalism"),
  list(num="08", batch=1, title="Why do Indians have Dowry and Africans Lobola? Pre-Colonial African Economic Systems"),
  list(num="09", batch=1, title="Who was the Richest Man Ever to Live? The Spread of Islam in Africa and the Crusades"),
  list(num="10", batch=1, title="How did 168 Spanish Conquistadores Capture an Empire? Europeans in the New World"),
  list(num="11", batch=1, title="Why was a Giraffe the Perfect Gift for the Chinese Emperor? The Indian Ocean Trade and European Imperialism"),
  list(num="12", batch=1, title="Who Visited Gorée Island on 27 June 2013? The Atlantic Slave Trade and Africa's Long-Run Development"),
  list(num="13", batch=1, title="What is an Incunabulum? Book Printing and the Reformation"),
  list(num="14", batch=1, title="Who was Autshumao's Niece? The Arrival of Europeans in South Africa and the Demise of the Khoesan"),
  list(num="15", batch=1, title="What did Thomson, Watson & Co. Purchase? The Emancipation of the Enslaved at the Cape"),
  list(num="16", batch=1, title="What do an Indonesian Volcano, Frankenstein and Shaka Zulu Have in Common? The Mfecane and the Great Trek"),
  list(num="17", batch=1, title="Why was the Spinning Jenny Not Invented in India? Science, Technology and the Industrial Revolution"),
  list(num="18", batch=2, title="Why did Railways Hurt Basotho Farmers? South Africa's Mineral Revolution"),
  list(num="19", batch=2, title="What did Sol Plaatje Find on his Journey through South Africa? Property Rights and Labour Coercion"),
  list(num="20", batch=2, title="Why Can you Have Any Car as Long as it is Black? The Rise of American Industry"),
  list(num="21", batch=2, title="What Does a Butterfly Collector do in the Congo? The Berlin Conference and the Colonisation of Africa"),
  list(num="22", batch=2, title="Who Wrote the Best Closing Line of Modern Literature? The Great Depression and the New Deal"),
  list(num="23", batch=2, title="How Could a Movie Embarrass Stalin? Russia and the Turn to Communism"),
  list(num="24", batch=2, title="Who is the Perfect Soldier? The Causes and Consequences of the Second World War"),
  list(num="25", batch=2, title="What was the Great Leap Forward? Mao Zedong, Famine and the Cultural Revolution"),
  list(num="26", batch=2, title="Why Should we Cry for Argentina? A Country Reverses"),
  list(num="27", batch=2, title="Who was the Last King of Scotland? African Independence Struggles"),
  list(num="28", batch=2, title="How did Einstein Help Create Eskom? South Africa Industrialises"),
  list(num="29", batch=2, title="Why Would you Want to Eat Sushi in the Transkei? The Economics of Apartheid"),
  list(num="30", batch=2, title="Why do the Japanese Play Rugby? The Rise of the East Asian Economies"),
  list(num="31", batch=2, title="Why Should We Thank Neil Armstrong for Our Daily Bread? The Green Revolution"),
  list(num="32", batch=2, title="What do Lego and the Greatest Invention of the Twentieth Century Have in Common? The Second Era of Globalisation"),
  list(num="33", batch=2, title="What is Funny about Moore's Law? ICT and the Fourth Industrial Revolution"),
  list(num="34", batch=2, title="What Bubbles in Iceland? The Global Financial Crisis of 2008"),
  list(num="35", batch=2, title="What Did The Economist Get Spectacularly Wrong? Africa after 2000"),
  list(num="36", batch=2, title="Will Madiba's Long Walk to Freedom Ever End? The First Thirty Years of Democracy and the Future of South Africa"),
  list(num="37", batch=2, title="What Should No Scholar Ever Do? Predicting the Future"),
  list(num="38", batch=2, title="Epilogue")
)

normalise <- function(s) {
  s <- tolower(s)
  s <- gsub("[‘’“”]", "'", s)   # curly quotes
  s <- gsub("[–—]", "-", s)               # en/em dash
  s <- gsub("[^a-z0-9 ]", "", s)                    # drop all other punctuation/accents
  s <- gsub("\\s+", " ", s)
  trimws(s)
}

slugify <- function(s) {
  s <- tolower(s)
  s <- chartr("àáâãäåèéêëìíîïòóôõöùúûüçñ", "aaaaaaeeeeiiiiooooouuuucn", s)  # de-accent
  s <- sub("\\?.*$", "", s)                          # keep up to the question
  s <- gsub("[‘’“”'].*", "", s)
  s <- gsub("[^a-z0-9]+", "-", s)
  s <- gsub("(^-+)|(-+$)", "", s)
  words <- strsplit(s, "-")[[1]]
  words <- words[!words %in% c("the","a","an","of","and","to","in","is","was","do","did","why","who","what","how","are","for","on","his","we","you","it")]
  paste(head(words, 4), collapse="-")
}

read_batch <- function(n) readLines(file(file.path(work, paste0("batch", n, ".md")), encoding="UTF-8"), warn=FALSE)

batches <- list(`1`=read_batch(1), `2`=read_batch(2))

# footnote-definition block start (first "[^N]:" line) per batch
fn_start <- lapply(batches, function(L) which(grepl("^\\[\\^[0-9]+\\]:", L))[1])

# parse footnote definitions per batch: id -> full line
fn_defs <- lapply(batches, function(L) {
  defs <- list()
  for (ln in L) {
    m <- regmatches(ln, regexec("^\\[\\^([0-9]+)\\]:", ln))[[1]]
    if (length(m) == 2) defs[[m[2]]] <- ln
  }
  defs
})

# locate each section's body heading line.
# Anchor on the QUESTION (text up to "?"): a body heading's normalised form starts with the
# normalised question and is not much longer than the title (guards against running-text
# sentences). TOC entries for numbered chapters carry a "16." prefix so they don't start with
# the question; intro/epilogue have no number, so last-occurrence picks the body over the TOC.
for (i in seq_along(sections)) {
  b <- sections[[i]]$batch
  L <- batches[[as.character(b)]]
  body_end <- fn_start[[as.character(b)]] - 1
  full <- sections[[i]]$title
  if (grepl("\\?", full)) {
    anchor <- normalise(sub("\\?.*$", "", full))          # question, sans "?"
    maxlen <- nchar(anchor) + 80
    match_fn <- function(j) {
      nl <- normalise(L[j])
      startsWith(nl, anchor) && nchar(nl) <= maxlen
    }
  } else {                                                 # epilogue: exact match
    anchor <- normalise(full)
    match_fn <- function(j) normalise(L[j]) == anchor
  }
  hits <- which(vapply(seq_len(body_end), match_fn, logical(1)))
  sections[[i]]$line <- if (length(hits)) tail(hits, 1) else NA_integer_
}

# validation gate
missing <- Filter(function(s) is.na(s$line), sections)
if (length(missing)) {
  cat("UNMATCHED SECTIONS:\n")
  for (m in missing) cat("  [", m$num, "] ", m$title, "\n", sep="")
  stop("Splitter aborted: not all sections located.")
}

# determine slice end = next heading in same batch (or body_end)
emit <- function(s, next_line, body_end) {
  b <- s$batch
  L <- batches[[as.character(b)]]
  end <- if (is.na(next_line)) body_end else next_line - 1
  body <- L[(s$line + 1):end]
  # trim leading/trailing blanks
  while (length(body) && body[1] == "") body <- body[-1]
  while (length(body) && body[length(body)] == "") body <- body[-length(body)]
  # footnotes referenced in this slice
  ids <- unique(unlist(regmatches(body, gregexpr("\\[\\^([0-9]+)\\]", body)) ))
  ids <- gsub("[^0-9]", "", ids)
  ids <- ids[ids != ""]
  ids <- as.character(sort(as.integer(unique(ids))))
  defs <- fn_defs[[as.character(b)]]
  used <- defs[ids[ids %in% names(defs)]]
  # title / subtitle split on first "?"; bake the chapter number into the title so the
  # sidebar reads "1. Who are the Architects of Wakanda?" (intro/epilogue stay unnumbered)
  full <- s$title
  if (grepl("\\?", full)) {
    q <- sub("\\?.*$", "?", full)
    sub_ <- trimws(sub("^[^?]*\\?", "", full))
  } else { q <- full; sub_ <- "" }
  n <- suppressWarnings(as.integer(s$num))
  if (!is.na(n) && n >= 1 && n <= 37) q <- paste0(n, ". ", q)
  yaml <- c("---",
            paste0("title: \"", gsub("\"","'", q), "\""),
            if (nzchar(sub_)) paste0("subtitle: \"", gsub("\"","'", sub_), "\"") else NULL,
            "date-modified: last-modified",
            "---", "")
  out <- c(yaml, body)
  if (length(used)) out <- c(out, "", unname(unlist(used)))
  slug <- if (s$num == "00") "introduction" else if (s$num == "38") "epilogue" else slugify(full)
  fname <- file.path(outdir, paste0(s$num, "-", slug, ".md"))
  con <- file(fname, "w", encoding="UTF-8"); writeLines(out, con); close(con)
  cat(sprintf("[%s] line %5d -> %-34s  body=%4d lines, footnotes=%d\n",
              s$num, s$line, basename(fname), length(body), length(used)))
}

# order sections within each batch by line, compute next-heading boundaries
for (b in 1:2) {
  idx <- which(vapply(sections, function(s) s$batch == b, logical(1)))
  ord <- idx[order(vapply(sections[idx], function(s) s$line, integer(1)))]
  body_end <- fn_start[[as.character(b)]] - 1
  for (k in seq_along(ord)) {
    s <- sections[[ord[k]]]
    nxt <- if (k < length(ord)) sections[[ord[k+1]]]$line else NA_integer_
    emit(s, nxt, body_end)
  }
}
cat("\nDone: 39 sections written (intro + 37 chapters + epilogue).\n")
