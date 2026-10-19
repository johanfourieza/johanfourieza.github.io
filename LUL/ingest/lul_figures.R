# =============================================================================
# Life under Lockdown – Figures 3 to 7 redrawn in the johanfourie.com house
# style (/olwstyle: brown/olive/cream palette, theme_olw, "Source … • Visualised"
# captions). Figures 1 and 2 are screenshots and are used as supplied.
#
# The original R code and data no longer exist, so:
#   * the text analysis (word clouds) is recomputed from the 335 published
#     entries – the book's own corpus (46 800 words) – with tidytext and the
#     bing / AFINN lexicons used in the book;
#   * the six weekly sentiment means and the week-specific theme words of
#     Figure 4 are taken from the printed figure, so the chart agrees with the
#     text ("sentiment … collapses in the final week");
#   * Covid-19 tests, cases and deaths come from the DSFSI/NICD covid19za
#     repository; the rand/dollar rate from FRED (DEXSFUS); the JSE All Share
#     Index from Yahoo Finance (^J203.JO). Downloads are cached in _cache/.
#
# Run:  "C:/Program Files/R/R-4.2.0/bin/Rscript.exe" LUL/ingest/lul_figures.R
# =============================================================================
suppressPackageStartupMessages({
  library(tidyverse); library(tidytext); library(ggwordcloud); library(patchwork)
  library(jsonlite); library(scales)
})

HERE   <- normalizePath(dirname(sub("--file=", "", grep("--file=", commandArgs(), value = TRUE))))
BOOK   <- normalizePath(file.path(HERE, ".."))
CACHE  <- file.path(HERE, "_cache")
OUTDIR <- file.path(BOOK, "images")

# ---- house style (from OLWTEF/ingest/olw_figures.R) -------------------------
OLW_COLORS <- c(darkbrown="#693e23", olive="#8f8844", burntorange="#db6a11",
                red="#ba1a20", teal="#4492a0", beige="#eccba7", mustard="#c29500")
OLW_BG <- "#f7f5f2"
theme_olw <- function(base_size = 13) {
  theme_minimal(base_size = base_size) %+replace%
    theme(
      plot.background  = element_rect(fill = OLW_BG, colour = NA),
      panel.background = element_rect(fill = OLW_BG, colour = NA),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(colour = "#e4ded6", linewidth = 0.4),
      legend.position  = "none",
      plot.title       = element_blank(),
      axis.title       = element_text(colour = "#693e23", size = rel(0.9)),
      axis.title.y     = element_text(angle = 90, margin = margin(r = 8)),
      axis.title.x     = element_text(margin = margin(t = 6)),
      axis.text        = element_text(colour = "#4a4a4a"),
      plot.caption     = element_text(size = 8, colour = "#693e23", hjust = 1,
                                      face = "italic", margin = margin(t = 8)),
      plot.margin      = margin(10, 14, 8, 10)
    )
}
CAP <- function(src) paste0("Source: ", src, " • Visualised: johanfourie.com")
sv  <- function(name, plot, w = 10, h = 6)
  ggsave(file.path(OUTDIR, name), plot, width = w, height = h, dpi = 300, bg = OLW_BG, device = "jpeg", quality = 92)

# ---- the corpus: the 335 published entries ---------------------------------
day_files <- list.files(BOOK, pattern = "^2020-\\d\\d-\\d\\d\\.md$", full.names = TRUE)
entries <- map_dfr(day_files, function(f) {
  txt <- readLines(f, encoding = "UTF-8", warn = FALSE)
  # drop YAML, the editors' context box and the ornaments
  body <- txt[-(1:which(txt == "---")[2])]
  inside <- FALSE; keep <- logical(length(body))
  for (i in seq_along(body)) {
    if (grepl("^::: \\{\\.day-context\\}", body[i])) { inside <- TRUE; next }
    if (inside && body[i] == ":::") { inside <- FALSE; next }
    keep[i] <- !inside && !grepl("^(:::|\\* \\* \\*)", body[i]) && nzchar(body[i])
  }
  tibble(date = as.Date(sub("\\.md$", "", basename(f))), text = body[keep])
}) %>% mutate(text = str_replace_all(text, "[*_\\[\\]…]", " "))

words <- entries %>%
  unnest_tokens(word, text) %>%
  filter(!str_detect(word, "^[0-9]+$"))
cat(sprintf("corpus: %d paragraphs, %d words\n", nrow(entries), nrow(words)))

# ---- Figure 3: frequency cloud + bing sentiment cloud ------------------------
set.seed(2020)
freq <- words %>% anti_join(stop_words, by = "word") %>%
  filter(!word %in% c("it’s", "i’m", "i’ve", "don’t", "didn’t", "can’t", "that’s")) %>%
  count(word, sort = TRUE) %>% slice_head(n = 90) %>%
  mutate(word = str_to_title(word))
p3a <- ggplot(freq, aes(label = word, size = n, colour = n)) +
  geom_text_wordcloud_area(family = "sans", rm_outside = TRUE, shape = "circle") +
  scale_size_area(max_size = 26) +
  scale_colour_gradient(low = "#8f8844", high = "#693e23") +
  theme_olw() + theme(panel.grid = element_blank(), axis.text = element_blank())

sent <- words %>% inner_join(get_sentiments("bing"), by = "word") %>%
  # bing scores "like" (mostly a preposition here), "work" and the name "Trump" as positive
  filter(!word %in% c("like", "work", "trump")) %>%
  count(word, sentiment, sort = TRUE) %>%
  group_by(sentiment) %>% slice_head(n = 50) %>% ungroup() %>%
  mutate(word = str_to_title(word),
         sentiment = factor(sentiment, c("negative", "positive"),
                            c("Negative sentiment", "Positive sentiment")))
p3b <- ggplot(sent, aes(label = word, size = n, colour = sentiment)) +
  geom_text_wordcloud_area(family = "sans", rm_outside = TRUE, shape = "circle") +
  scale_size_area(max_size = 28) +
  scale_colour_manual(values = c(`Negative sentiment` = "#ba1a20", `Positive sentiment` = "#4492a0")) +
  facet_wrap(~sentiment, ncol = 1) +
  theme_olw() + theme(panel.grid = element_blank(), axis.text = element_blank(),
                      strip.text = element_text(colour = "#693e23", face = "bold", size = 12))
p3 <- (p3a | p3b) + plot_layout(widths = c(1.15, 1)) &
  theme(plot.background = element_rect(fill = OLW_BG, colour = NA))
p3 <- p3 + plot_annotation(caption = CAP("The 335 diary entries; bing sentiment lexicon"),
                           theme = theme_olw())
sv("figure-3.jpg", p3, w = 11, h = 5.5)
cat("  ok figure-3\n")

# ---- Figure 4: weekly sentiment + week-specific themes -----------------------
# Values and words as printed (the original data are gone; see header).
wk <- tibble(
  date  = as.Date(c("2020-03-24", "2020-03-31", "2020-04-07", "2020-04-14", "2020-04-21", "2020-04-22")),
  sent  = c(-0.415, -0.340, -0.405, -0.072, -0.100, -0.503),
  words = c("National lockdown\nChurch\nAfrican leaders\nAirports\nNSFAS",
            "Townships\nLockdown starts\nVirus\nInternet access\nCases recorded",
            "Conspiracy theories\nContinues to rise\nPrivilege\nAn obligation",
            "Easter Sunday\nHot Cross buns\nGood Friday\nPayment\nExtension\nEmotions",
            "R500 billion\nEconomic stimulus\nFresh produce\nSUN Learn\nZoom\nGrade",
            "Clothing bank\nPresident Ramaphosa\nLevel 5\nLivelihoods\nUnemployed\nLockdown restrictions"),
  ly    = c(-0.30, -0.22, -0.27, 0.03, 0.03, -0.37),   # label anchor (y)
  lx    = c(0, 0, 0, 0, 0, 0.4)                          # label x nudge (days)
)
# cross-check against AFINN recomputed from the published entries (log only)
afinn_lex <- tryCatch(get_sentiments("afinn"), error = function(e) NULL)   # needs a one-off interactive download (textdata)
if (!is.null(afinn_lex)) {
  afinn <- words %>% inner_join(afinn_lex, by = "word") %>%
    mutate(week = cut(date, breaks = as.Date(c("2020-03-21", "2020-03-28", "2020-04-04", "2020-04-11", "2020-04-18", "2020-04-25")), right = FALSE)) %>%
    group_by(week) %>% summarise(mean_afinn = mean(value), n = n())
  cat("AFINN check (published entries, 7-day bins from 21 March):\n"); print(afinn)
} else cat("AFINN cross-check skipped (lexicon not downloaded; run textdata::lexicon_afinn() once interactively)\n")

date_axis <- list(
  scale_x_date(breaks = as.Date(c("2020-03-23", "2020-03-30", "2020-04-06", "2020-04-13", "2020-04-20")),
               date_labels = "%b %d", limits = as.Date(c("2020-03-20", "2020-04-25")))
)
p4_core <- function(with_words = TRUE, base = 13) {
  g <- ggplot(wk, aes(date, sent)) +
    geom_hline(yintercept = 0, linetype = "dashed", colour = "#693e23") +
    geom_line(colour = "#693e23", linewidth = 0.9) +
    geom_point(colour = "#db6a11", size = 3.4) +
    date_axis +
    scale_y_continuous(limits = c(-0.56, 0.12), breaks = seq(-0.5, 0.1, 0.1)) +
    labs(x = NULL, y = "Average sentiment of students' diary entries") +
    theme_olw(base)
  if (with_words) g <- g + geom_text(aes(x = date + lx, y = ly, label = words), colour = "#8f8844",
                                      size = 3.3, lineheight = 0.95, family = "sans")
  g
}
p4 <- p4_core() +
  labs(caption = paste0("Note: words displayed are most specific to each week of diary entries.  ",
                        CAP("The 335 diary entries; AFINN lexicon; weighted log odds (tidylo)")))
sv("figure-4.jpg", p4, w = 10, h = 6.5)
cat("  ok figure-4\n")

# ---- Covid-19 data (DSFSI / NICD) --------------------------------------------
rd <- function(f) read_csv(file.path(CACHE, f), show_col_types = FALSE) %>%
  mutate(date = as.Date(as.character(YYYYMMDD), "%Y%m%d"))
cases  <- rd("covid19za_provincial_cumulative_timeline_confirmed.csv") %>% select(date, cases = total)
deaths <- rd("covid19za_provincial_cumulative_timeline_deaths.csv")    %>% select(date, deaths = total)
# the testing series skips some days: fill the calendar and interpolate the cumulative count
tests  <- rd("covid19za_timeline_testing.csv") %>% select(date, cum_tests = cumulative_tests) %>%
  filter(!is.na(cum_tests)) %>% arrange(date) %>%
  complete(date = seq(min(date), max(date), by = "day")) %>%
  mutate(cum_tests = approx(date, cum_tests, xout = date)$y,
         tests = cum_tests - lag(cum_tests),
         # daily reporting is lumpy: smooth with a 7-day trailing mean
         tests = stats::filter(tests, rep(1/7, 7), sides = 1) %>% as.numeric())
covid <- cases %>% full_join(deaths, by = "date") %>% full_join(tests, by = "date") %>%
  arrange(date) %>% mutate(deaths = replace_na(deaths, 0))

# ---- Figure 5: sentiment above tests / cases / deaths ------------------------
cv5 <- covid %>% filter(date >= as.Date("2020-03-21"), date <= as.Date("2020-04-23")) %>%
  select(date, `Tests per day (7-day average)` = tests, `Total cases` = cases, `Total deaths` = deaths) %>%
  pivot_longer(-date, names_to = "series") %>%
  mutate(series = factor(series, c("Tests per day (7-day average)", "Total cases", "Total deaths")))
p5b <- ggplot(cv5, aes(date, value, colour = series, linetype = series)) +
  geom_line(linewidth = 0.9) +
  date_axis +
  scale_y_continuous(labels = label_comma(big.mark = " ")) +
  scale_colour_manual(values = c("#693e23", "#db6a11", "#ba1a20")) +
  scale_linetype_manual(values = c("solid", "longdash", "dotted")) +
  labs(x = NULL, y = "Tests, cases, deaths", colour = NULL, linetype = NULL) +
  theme_olw() + theme(legend.position = "bottom", legend.text = element_text(size = 10))
p5 <- (p4_core(TRUE, 12) / p5b) + plot_layout(heights = c(1, 1)) +
  plot_annotation(caption = CAP("The 335 diary entries (AFINN); DSFSI/NICD covid19za"), theme = theme_olw())
sv("figure-5.jpg", p5, w = 10, h = 9)
cat("  ok figure-5\n")

# ---- Figure 6: cases and deaths, March 2020 – April 2021 ---------------------
cv6 <- covid %>% filter(date >= as.Date("2020-03-05"), date <= as.Date("2021-04-01")) %>%
  select(date, cases, deaths)
k <- 10   # deaths plotted on a secondary axis = cases / 10
p6 <- ggplot(cv6) +
  annotate("rect", xmin = as.Date("2020-03-21"), xmax = as.Date("2020-04-23"), ymin = -Inf, ymax = Inf,
           fill = "#eccba7", alpha = 0.7) +
  annotate("text", x = as.Date("2020-04-07"), y = 1500000, label = "Period of\ndiary entries",
           colour = "#693e23", size = 3.3, lineheight = 0.9, vjust = 1) +
  geom_line(aes(date, cases, colour = "Total cases", linetype = "Total cases"), linewidth = 0.9) +
  geom_line(aes(date, deaths * k, colour = "Total deaths", linetype = "Total deaths"), linewidth = 0.9) +
  scale_x_date(date_breaks = "3 months", date_labels = "%b %Y") +
  scale_y_continuous(labels = label_comma(big.mark = " "), name = "Number of cases",
                     sec.axis = sec_axis(~ . / k, name = "Number of deaths", labels = label_comma(big.mark = " "))) +
  scale_colour_manual(values = c(`Total cases` = "#693e23", `Total deaths` = "#ba1a20")) +
  scale_linetype_manual(values = c(`Total cases` = "solid", `Total deaths` = "dotted")) +
  labs(x = NULL, colour = NULL, linetype = NULL, caption = CAP("DSFSI/NICD covid19za")) +
  theme_olw() + theme(legend.position = "bottom")
sv("figure-6.jpg", p6, w = 10, h = 6)
cat("  ok figure-6\n")

# ---- Figure 7: sentiment, JSE All Share, rand/dollar ---------------------------
fx <- read_csv(file.path(CACHE, "dexsfus.csv"), show_col_types = FALSE, na = c("", ".")) %>%
  transmute(date = as.Date(observation_date), value = as.numeric(DEXSFUS), series = "ZAR to USD exchange rate") %>%
  filter(!is.na(value))
j <- fromJSON(file.path(CACHE, "jalsh.json"))$chart$result
jse <- tibble(date = as.Date(as.POSIXct(j$timestamp[[1]], origin = "1970-01-01", tz = "Africa/Johannesburg")),
              value = j$indicators$quote[[1]]$close[[1]], series = "JSE All Share Index") %>% filter(!is.na(value))
s7 <- wk %>% transmute(date, value = sent, series = "Mean sentiment of students' diary entries")
d7 <- bind_rows(s7, jse, fx) %>%
  filter(date >= as.Date("2020-03-21"), date <= as.Date("2020-04-24")) %>%
  mutate(series = factor(series, c("Mean sentiment of students' diary entries", "JSE All Share Index", "ZAR to USD exchange rate")))
p7 <- ggplot(d7, aes(date, value, colour = series, linetype = series)) +
  geom_line(linewidth = 0.9) +
  facet_wrap(~series, ncol = 1, scales = "free_y") +
  date_axis +
  scale_y_continuous(labels = label_comma(big.mark = " ")) +
  scale_colour_manual(values = c("#693e23", "#db6a11", "#4492a0")) +
  scale_linetype_manual(values = c("solid", "longdash", "dotted")) +
  labs(x = NULL, y = NULL, caption = CAP("The 335 diary entries (AFINN); Yahoo Finance (^J203.JO); FRED (DEXSFUS)")) +
  theme_olw() + theme(strip.text = element_text(colour = "#f7f5f2", face = "bold", size = 11),
                      strip.background = element_rect(fill = "#693e23", colour = NA))
sv("figure-7.jpg", p7, w = 10, h = 8)
cat("  ok figure-7\n")
cat("done ->", OUTDIR, "\n")
