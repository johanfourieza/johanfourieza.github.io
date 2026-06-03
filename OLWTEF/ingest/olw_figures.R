# =============================================================================
# Our Long Walk to Economic Freedom – ALL book figures in the OLW house style
# (/olwstyle), in colour. Canonical figure builder (supersedes regen_figures.R
# and regen_remaining.R). Restyles the 19 existing R figures and builds the 4
# that had no R source (3.1, 8.1, 9.1, 12.1). Saves figure-X-Y.jpg into _olw/.
# Data: OLWEF/Data ; basemaps: rnaturalearth (bundled, public).
# =============================================================================

OLWEF  <- "C:/Users/johanf/Dropbox/0Claude0/4JohanFourie/OLWEF"
OUTDIR <- file.path(OLWEF, "Graphs", "_olw")
dir.create(OUTDIR, showWarnings = FALSE, recursive = TRUE)
setwd(OLWEF)

for (p in c("tidyverse","reshape2","readxl","scales","ggrepel","ggpubr","janitor",
            "zoo","sf","rnaturalearth","rnaturalearthdata","countrycode"))
  suppressWarnings(suppressMessages(library(p, character.only = TRUE)))

# ---- OLW visual identity ----------------------------------------------------
OLW_COLORS <- c(darkbrown="#693e23", olive="#8f8844", burntorange="#db6a11",
                red="#ba1a20", teal="#4492a0", beige="#eccba7", mustard="#c29500")
OLW_CYCLE  <- unname(OLW_COLORS)
OLW_EXT    <- c(OLW_CYCLE, "#a9a9a9","#8b4513","#2f4f4f","#556b2f","#483d8b","#bc8f8f","#6b8e23")
OLW_BG <- "#f7f5f2"; OLW_SCATTER <- "#4a7c59"; OLW_TREND <- "#db6a11"
OLW_SA <- "#c29500"; OLW_LAND <- "#e7ddc9"
scale_colour_olw <- function(...) scale_colour_manual(values = OLW_CYCLE, ...)
scale_color_olw  <- scale_colour_olw
scale_fill_olw   <- function(...) scale_fill_manual(values = OLW_CYCLE, ...)

theme_olw <- function(base_size = 13) {
  theme_minimal(base_size = base_size) %+replace%
    theme(
      plot.background  = element_rect(fill = OLW_BG, colour = NA),
      panel.background = element_rect(fill = OLW_BG, colour = NA),
      panel.grid.minor = element_blank(),
      legend.position  = "none",
      plot.title       = element_blank(),
      plot.caption     = element_text(size = 8, colour = "#693e23", hjust = 1,
                                      face = "italic", margin = margin(t = 8))
    )
}
theme_olw_map <- function() theme_olw() +
  theme(axis.text = element_blank(), axis.title = element_blank(),
        panel.grid = element_blank())

CAP <- function(src) paste0("Source: ", src, " • Visualised: johanfourie.com")
sv  <- function(name, plot, w = 10, h = 6)
  ggplot2::ggsave(file.path(OUTDIR, name), plot, width = w, height = h, dpi = 300, bg = OLW_BG)
theme_minimalistic_bw <- function(...) theme_olw()
p_load <- function(...) invisible(NULL)

run <- function(label, expr) {
  r <- try(expr, silent = TRUE)
  if (inherits(r, "try-error"))
    cat(sprintf("  FAIL  %-6s %s\n", label, sub("\n.*", "", conditionMessage(attr(r, "condition")))))
  else cat(sprintf("  ok    %-6s\n", label))
}

# =============================================================================
# PART A – the 19 existing figures, restyled to OLW colour
# =============================================================================

## 1.1 – world population by poverty threshold (stacked area)
run("1.1", {
  pd <- read_excel("Data/poverty.xlsx")
  colnames(pd) <- c("Entity","Code","Year","Above_30","a1","10_to_30","a2","5_to_10","a3",
                    "1.90_to_5","a4","Below_1.90","a5")
  pd <- pd[, c("Entity","Year","Above_30","10_to_30","5_to_10","1.90_to_5","Below_1.90")]
  pd$total <- rowSums(pd[, 3:7])
  for (cc in c("Above_30","10_to_30","5_to_10","1.90_to_5","Below_1.90"))
    pd[[paste0(cc,"_pct")]] <- pd[[cc]] / pd$total * 100
  m <- melt(pd, id.vars = c("Entity","Year"),
            measure.vars = paste0(c("Above_30","10_to_30","5_to_10","1.90_to_5","Below_1.90"),"_pct"))
  m <- m %>% filter(Entity == "World")
  p <- ggplot(m, aes(Year, value, fill = variable)) +
    geom_area() +
    scale_fill_manual(values = c(Above_30_pct="#eccba7", `10_to_30_pct`="#c29500",
                                 `5_to_10_pct`="#db6a11", `1.90_to_5_pct`="#ba1a20",
                                 Below_1.90_pct="#693e23"),
                      labels = c("Above $30 a day","$10–$30 a day","$5–$10 a day",
                                 "$1.90–$5 a day","Below $1.90 a day")) +
    scale_y_continuous(labels = scales::percent_format(scale = 1)) +
    labs(x = NULL, y = "Share of world population", fill = NULL, caption = CAP("Our World in Data")) +
    theme_olw() + theme(legend.position = "bottom")
  sv("figure-1-1.jpg", p)
})

## 2.1 – genetic diversity vs population density (scatter)
run("2.1", {
  ag <- read_excel("Data/ashraf and galor.xlsx")
  p <- ggplot(ag, aes(x, y)) +
    geom_hline(yintercept = 0, lty = 2, colour = "grey70") +
    stat_smooth(method = "lm", formula = y ~ x + I(x^2), linewidth = 1, se = FALSE, colour = OLW_TREND) +
    geom_point(colour = OLW_SCATTER, size = 2.6, alpha = 0.85) +
    geom_text_repel(aes(label = country_name), size = 3.4, colour = "#693e23", max.overlaps = 20) +
    labs(x = "Genetic homogeneity (observed)", y = "Log of population density in 1500 CE",
         caption = CAP("Ashraf and Galor (2013)")) +
    theme_olw()
  sv("figure-2-1.jpg", p)
})

## 5.1 – Bantu migration map
run("5.1", {
  world <- ne_countries(scale = "medium", returnclass = "sf")
  aac  <- read_rds("Data/arrow_areas_coords.rds")
  aac2 <- read_rds("Data/arrow_areas_2_coords.rds")
  aac3 <- read_rds("Data/arrow_areas_3_coords.rds") %>% rename(value1 = value)
  ad2  <- cbind(aac2, aac3) %>% as_tibble() %>% select(-value, -value1)
  yaonde <- aac %>% filter(value == "yaounde, cameroon")
  ad1 <- aac %>% filter(value != "yaounde, cameroon") %>%
    mutate(lat2 = yaonde$lat1, long2 = yaonde$long1) %>% select(-value)
  lab <- tibble(x = c(22,36,8), y = c(-3,-25,9),
                label = c("Movement of Bantu speakers\nby 1000 BCE","Further movement\nby 300 CE","Bantu homeland\nby 3000 BCE"))
  p <- ggplot(world) +
    geom_sf(fill = OLW_LAND, colour = "white") +
    coord_sf(ylim = c(-35,10), xlim = c(-10,50)) +
    geom_curve(data = ad1, aes(y = lat2, x = long2, yend = lat1, xend = long1),
               curvature = -.3, linewidth = 1.2, colour = "#8f8844",
               arrow = arrow(length = unit(0.02,"npc"), type = "closed")) +
    geom_curve(data = ad2, aes(y = lat1, x = long1, yend = lat2, xend = long2),
               curvature = .3, linewidth = 1.2, colour = "#693e23", lty = 2,
               arrow = arrow(length = unit(0.02,"npc"), type = "closed")) +
    geom_point(data = yaonde, aes(long1, lat1), shape = 19, size = 6, colour = "#693e23") +
    geom_text_repel(data = lab, aes(x, y, label = label), size = 4.4, colour = "#693e23") +
    labs(x = NULL, y = NULL, caption = CAP("Wikipedia – 'Bantu expansion'")) +
    theme_olw_map()
  sv("figure-5-1.jpg", p)
})

## 13.1 – printed book production by region
run("13.1", {
  db <- read_excel("Data/printedbooks.xlsx") %>% pivot_longer(!country, names_to = "period", values_to = "stat")
  labs13 <- db %>% group_by(country) %>% filter(period == "1751-1800") %>% ungroup()
  p <- db %>% mutate(country = fct_reorder(country, stat, .fun = max)) %>%
    ggplot(aes(period, stat, colour = country, group = country)) +
    geom_line(linewidth = 1) + geom_point(size = 1.6) +
    geom_text_repel(data = labs13, aes(label = country), hjust = -.1, size = 4, direction = "y", segment.colour = "grey70") +
    scale_colour_manual(values = OLW_EXT) +
    scale_y_continuous(labels = scales::comma_format(big.mark = " ")) +
    scale_x_discrete(expand = expansion(mult = c(0.02, 0.22))) +
    labs(y = "Printed books per half-century", x = NULL, caption = CAP("Buringh and Van Zanden (2009)")) +
    theme_olw()
  sv("figure-13-1.jpg", p)
})

## 14.1 – GDP per capita: Yangzi, European frontier, Cape
run("14.1", {
  df <- read_excel("Data/Figure_13_1_china_cape.xlsx")
  long <- df %>% pivot_longer(-year) %>% filter(name != "China")
  labs14 <- long %>% filter(!is.na(value)) %>% group_by(name) %>% filter(year == max(year)) %>% ungroup()
  p <- ggplot(long, aes(year, value, colour = name)) +
    geom_line(linewidth = 1, na.rm = TRUE) + geom_point(size = 1.4, na.rm = TRUE) +
    geom_text_repel(data = labs14, aes(label = name), hjust = 0, nudge_x = 4, size = 3.8,
                    direction = "y", segment.colour = "grey70") +
    scale_colour_olw() +
    scale_y_continuous(labels = scales::dollar_format()) +
    scale_x_continuous(expand = expansion(mult = c(0.02, 0.2))) +
    expand_limits(y = 0) +
    labs(x = NULL, y = "GDP per capita (1990 international $)",
         caption = CAP("Fourie and Van Zanden (2013); Broadberry, Guan and Li (2021)")) +
    theme_olw()
  sv("figure-14-1.jpg", p)
})

## 17.1 – GDP per capita in England (single line, log)
run("17.1", {
  d <- read_excel("Data/GDPUK.xlsx") %>% as_tibble() %>% transmute(year = Year, gdp = round(GDP))
  p <- ggplot(d, aes(year, gdp)) +
    geom_line(linewidth = 1, colour = "#693e23") +
    scale_y_log10(labels = scales::unit_format(prefix = "£", suffix = "")) +
    labs(x = NULL, y = "GDP per capita in England (log scale, 2013 GBP)",
         caption = CAP("Maddison Project (2024)")) +
    theme_olw()
  sv("figure-17-1.jpg", p)
})

## 18.1 – Cape Colony debt-to-GDP
run("18.1", {
  ad <- read_excel("Data/abel_data.xlsx")
  p <- ggplot(ad, aes(x, y, colour = series)) +
    geom_line(linewidth = 1.3) +
    scale_colour_olw() +
    scale_y_continuous(labels = scales::percent_format(scale = 1)) +
    labs(x = NULL, y = "Debt-to-GDP ratio", colour = NULL, caption = CAP("Gwaindepi and Fourie (2020)")) +
    theme_olw() + theme(legend.position = "bottom")
  sv("figure-18-1.jpg", p)
})

## 19.1 – height of South African black men (SA -> mustard)
run("19.1", {
  bh <- read_excel("Data/black_heights_new.xlsx") %>% group_by(Year) %>%
    summarise(average = mean(Height, na.rm = TRUE),
              cib = average - qt(.975, df = n()-1)*sd(Height, na.rm = TRUE)/sqrt(n()),
              cit = average + qt(.975, df = n()-1)*sd(Height, na.rm = TRUE)/sqrt(n()), .groups = "drop") %>%
    arrange(Year) %>%
    mutate(a = rollmean(average, 10, fill = NA, align = "center"),
           lo = rollmean(cib, 10, fill = NA, align = "center"),
           hi = rollmean(cit, 10, fill = NA, align = "center")) %>%
    filter(!is.na(a))
  p <- ggplot(bh, aes(Year)) +
    geom_ribbon(aes(ymin = lo, ymax = hi), fill = OLW_SA, alpha = 0.18) +
    geom_line(aes(y = a), colour = OLW_SA, linewidth = 1.2) +
    geom_vline(xintercept = c(1931, 1949), linetype = "dashed", colour = "grey70") +
    coord_cartesian(ylim = c(165, 170)) +
    labs(x = NULL, y = "Height (cm)", caption = CAP("Mpeta, Fourie and Inwood (2018)")) +
    theme_olw()
  sv("figure-19-1.jpg", p)
})

## shared Maddison frame (23.1, 26)
df_mad <- read.csv("Data/maddison_project_database.csv") %>% janitor::clean_names() %>% as_tibble() %>%
  select(countrycode, country, year, cgdppc, rgdpnapc, pop, i_cig, i_bm) %>%
  pivot_longer(cgdppc:pop, names_to = "indicator_name", values_to = "stat") %>%
  select(-i_cig, -i_bm) %>%
  mutate(indicator_code = indicator_name) %>%
  rename(country_code = countrycode, country_name = country) %>%
  mutate(year = as.numeric(year))

## 23.1 – US vs USSR GDP per capita (direct-labelled)
run("23.1", {
  d <- df_mad %>% filter(country_name %in% c("United States","Former USSR"),
                         indicator_code == "cgdppc", year >= 1885)
  labs231 <- d %>% group_by(country_name) %>% filter(year == max(year)) %>% ungroup()
  p <- ggplot(d, aes(year, stat, colour = country_name)) +
    geom_line(linewidth = 1.1) +
    geom_text_repel(data = labs231, aes(label = country_name), hjust = 0, nudge_x = 3,
                    direction = "y", size = 3.8, segment.colour = "grey70") +
    scale_colour_manual(values = c("United States" = "#693e23", "Former USSR" = "#db6a11")) +
    scale_y_continuous(labels = scales::comma_format(big.mark = " ")) +
    scale_x_continuous(expand = expansion(mult = c(0.02, 0.16))) +
    labs(y = "GDP per capita (constant 2010 US$)", x = NULL, caption = CAP("Maddison Project Database (2024)")) +
    theme_olw()
  sv("figure-23-1.jpg", p)
})

## 23.2 – life expectancy in former communist countries (direct-labelled)
run("23.2", {
  le <- read_excel("Data/life-expectancy-communism-our world in data.xlsx") %>% janitor::clean_names() %>%
    filter(year >= 1960, entity %in% c("Czech Republic","Poland","Slovakia","Hungary","Romania","Bulgaria"))
  labs232 <- le %>% group_by(entity) %>% filter(year == max(year)) %>% ungroup()
  p <- ggplot(le, aes(year, life_expectancy, colour = entity)) +
    geom_line(linewidth = 1.2) +
    geom_vline(xintercept = 1990, lty = 2, colour = "grey70") +
    geom_text_repel(data = labs232, aes(label = entity), hjust = 0, nudge_x = 1, size = 3.6,
                    direction = "y", segment.colour = "grey70") +
    scale_colour_manual(values = OLW_EXT) +
    scale_y_continuous(labels = scales::unit_format(suffix = " yrs", accuracy = 1)) +
    scale_x_continuous(limits = c(1960, 2032), expand = expansion(mult = c(0.02, 0.02))) +
    labs(x = NULL, y = "Life expectancy at birth",
         caption = CAP("Our World in Data (2024) – dashed line: fall of communism")) +
    theme_olw()
  sv("figure-23-2.jpg", p)
})

## 25.1 – Great Leap Forward: draught animals & cowhides (two panels)
run("25.1", {
  g <- read.csv("Data/animals_cowhides.csv") %>% as_tibble() %>% mutate(panel = factor(panel))
  mk <- function(pp, ylab, cap) {
    g %>% filter(panel == pp) %>% ggplot(aes(year, stat)) +
      geom_line(linewidth = 1, colour = "#693e23") + geom_point(size = 1.6, colour = "#693e23") +
      geom_vline(xintercept = 1954, lty = 2, colour = "grey70") +
      scale_y_continuous(labels = scales::number_format(suffix = "m", accuracy = 1)) +
      labs(x = NULL, y = ylab, caption = cap) + theme_olw()
  }
  p <- ggarrange(mk("a","Inventory of draught animals",""),
                 mk("b","Cowhides sold", CAP("Chen and Lan (2017)")), ncol = 1, nrow = 2)
  sv("figure-25-1.jpg", p)
})

## 26 – GDP per capita 1900 vs 2000 (scatter)
run("26.1", {
  pick <- function(a,b,t) df_mad %>% filter(year >= a, year <= b) %>% group_by(country_name) %>%
    filter(year == median(year)) %>% ungroup() %>% mutate(time = t)
  comp <- rbind(pick(1990,2010,2000), pick(1890,1910,1900)) %>% arrange(country_name, time) %>%
    select(!year) %>% pivot_wider(names_from = time, values_from = stat) %>%
    mutate(continent = countrycode(country_code, origin = "iso3c", destination = "continent"),
           country_name = str_remove(country_name, "\\(.*")) %>%
    filter(indicator_code == "cgdppc", !is.na(continent))
  p <- comp %>% filter(country_code != "ARG") %>%
    ggplot(aes(`1900`, `2000`, label = country_name, colour = continent, shape = continent)) +
    geom_point(size = 2.6) + geom_text_repel(size = 3.1, max.overlaps = 30, show.legend = FALSE) +
    geom_label_repel(data = comp %>% filter(country_code == "ARG"),
                     aes(`1900`, `2000`, label = country_name), inherit.aes = FALSE, size = 3.2) +
    scale_colour_manual(values = OLW_CYCLE) +
    scale_shape_manual(values = seq(15, 20)) +
    scale_x_continuous(labels = scales::dollar_format(big.mark = " ")) +
    scale_y_continuous(labels = scales::dollar_format(big.mark = " "), limits = c(0, 60000)) +
    labs(x = "GDP per capita in 1900", y = "GDP per capita in 2000", colour = NULL, shape = NULL,
         caption = CAP("Maddison Project Database (2024)")) +
    theme_olw() + theme(legend.position = "bottom")
  sv("figure-26-1.jpg", p)
})

## 27.1 – welfare ratios across cities
run("27.1", {
  fr <- read_csv("Data/Frankema.csv", show_col_types = FALSE) %>% filter(x < 1960)
  labs27 <- fr %>% group_by(city) %>% filter(x == max(x)) %>% ungroup()
  p <- ggplot(fr, aes(x, y, colour = city)) +
    geom_line(linewidth = 1) + geom_point(size = 1.4) +
    geom_text_repel(data = labs27, aes(label = city), hjust = 0, nudge_x = 1.5, size = 3.4,
                    direction = "y", segment.colour = "grey70") +
    scale_colour_manual(values = OLW_EXT) +
    scale_x_continuous(expand = expansion(mult = c(0.02, 0.18))) +
    labs(x = NULL, y = "Welfare ratio", caption = CAP("Frankema and Van Waijenburg (2012)")) +
    theme_olw()
  sv("figure-27-1.jpg", p)
})

## 30.1 – schooling/test scores vs growth (two panels, scatter + trend)
run("30.1", {
  st <- read_excel("Data/schooling_test_scores_1.xlsx")
  mk <- function(pp, xlab, cap, xlim = NULL) {
    d <- st %>% filter(panel == pp)
    g <- ggplot(d, aes(x, y)) +
      geom_smooth(method = "lm", se = FALSE, colour = OLW_TREND, linewidth = 0.9, formula = y ~ x) +
      geom_point(colour = OLW_SCATTER, size = 2, alpha = 0.85) +
      geom_text_repel(data = d %>% filter(country != "grey"), aes(label = country), size = 3, colour = "#693e23") +
      scale_y_continuous(labels = scales::percent_format(scale = 1), limits = c(-.2, 6.5)) +
      labs(y = "Growth rate", x = xlab, caption = cap) + theme_olw()
    if (!is.null(xlim)) g <- g + scale_x_continuous(limits = xlim)
    g
  }
  p <- ggarrange(mk("a","Years of schooling",""),
                 mk("b","Test score", CAP("Hanushek and Woessmann (2016)"), c(-.5,3)), ncol = 2, nrow = 1)
  sv("figure-30-1.jpg", p)
})

## 32.1 – volume of global exports (single line, two eras shaded)
run("32.1", {
  wt <- read_csv("Data/world-trade-exports-constant-prices.csv", show_col_types = FALSE)
  p <- ggplot(wt, aes(Year, `World Trade`)) +
    annotate("rect", xmin = 1870, xmax = 1913, ymin = -Inf, ymax = Inf, fill = "#eccba7", alpha = 0.35) +
    annotate("rect", xmin = 1950, xmax = 2007, ymin = -Inf, ymax = Inf, fill = "#eccba7", alpha = 0.35) +
    geom_line(linewidth = 1.3, colour = "#693e23") +
    scale_y_continuous(labels = scales::comma_format(big.mark = " ")) +
    annotate("text", x = 1891, y = 3400, label = "First era of\nglobalisation", size = 3.6, colour = "#693e23") +
    annotate("text", x = 1978, y = 3400, label = "Second era of\nglobalisation", size = 3.6, colour = "#693e23") +
    labs(x = NULL, y = "Volume of global exports (1913 = 100)", caption = CAP("Federico and Tena-Junguito (2016)")) +
    theme_olw()
  sv("figure-32-1.jpg", p)
})

## 33.1 – Moore's law (scatter by chip designer, log y)
run("33.1", {
  tr <- read_rds("Data/df_transistors.rds") %>% mutate(designer = fct_lump(designer, 5)) %>%
    filter(!(date_ofintroduction > 2010 & mos_transistor_count < 10000))
  set_lab <- tr %>% group_by(designer) %>% slice_head(n = 3) %>% ungroup()
  p <- ggplot(tr, aes(date_ofintroduction, mos_transistor_count)) +
    geom_point(aes(colour = designer, shape = designer), size = 2.4, alpha = 0.9) +
    scale_colour_manual(values = OLW_CYCLE) + scale_shape_manual(values = seq(15, 20)) +
    scale_y_log10(labels = scales::comma_format(big.mark = " ")) +
    labs(x = NULL, y = "Transistor count (log scale)", colour = NULL, shape = NULL,
         caption = CAP("Wikipedia – 'Transistor count' (2020)")) +
    theme_olw() + theme(legend.position = "bottom")
  sv("figure-33-1.jpg", p)
})

## 35.1 – share of deaths from HIV/AIDS, 2000 (world choropleth)
run("35.1", {
  sda <- read_csv("Data/share-deaths-aids.csv", show_col_types = FALSE) %>%
    rename(share_death = `Deaths - HIV/AIDS - Sex: Both - Age: All Ages (Percent)`) %>%
    filter(Year == 2000, !is.na(Code)) %>%
    mutate(iso_a3 = countrycode(Entity, origin = "country.name", destination = "iso3c"))
  world <- ne_countries(scale = "medium", returnclass = "sf")
  df_sf <- world %>% left_join(sda, by = "iso_a3")
  p <- ggplot(df_sf) +
    geom_sf(aes(fill = share_death), colour = "white", linewidth = 0.1) +
    scale_fill_gradient(low = "#eccba7", high = "#ba1a20", na.value = "#ece7df",
                        labels = scales::percent_format(scale = 1), breaks = seq(0, 60, 10)) +
    coord_sf(ylim = c(-50, 70), xlim = c(-120, 150)) +
    guides(fill = guide_colorbar(barwidth = 18, barheight = 0.5, title.position = "top", title.hjust = .5)) +
    labs(caption = CAP("IHME, Global Burden of Disease (2020)"), fill = "Share of deaths from HIV/AIDS, 2000") +
    theme_olw_map() + theme(legend.position = "bottom")
  sv("figure-35-1.jpg", p)
})

## 35.2 – share of countries with any 'bad policy'
run("35.2", {
  bp <- read_excel("Data/any_bad_policy.xlsx")
  labs35 <- bp %>% group_by(country) %>% filter(x == min(x[x >= 1981 & x < 1990])) %>% ungroup()
  p <- ggplot(bp, aes(x, y, colour = country)) +
    geom_line(linewidth = 1.2) +
    geom_text_repel(data = labs35, aes(label = country), size = 3.3, direction = "y", nudge_x = 6, segment.colour = "grey60") +
    scale_colour_olw() +
    scale_x_continuous(breaks = seq(1960, 2015, 10), expand = expansion(mult = c(0.02, 0.12))) +
    scale_y_continuous(labels = scales::percent_format()) +
    labs(y = "Share of countries with any bad policy", x = NULL, caption = CAP("Easterly (2019)")) +
    theme_olw()
  sv("figure-35-2.jpg", p)
})

## 36.1 – poverty headcount by region (South Africa -> mustard)
run("36.1", {
  dp <- readRDS("Data/df_pov.rds") %>% filter(!is.na(stat)) %>%
    filter(indicator_code == "SI.POV.DDAY", year >= 1994, year <= 2016,
           country_name %in% c("South Africa","Sub-Saharan Africa","South Asia","World",
                               "Middle East & North Africa","East Asia % Pacific","Europe & Central Asia")) %>%
    mutate(country_name = fct_reorder(country_name, -stat))
  labs36 <- dp %>% group_by(country_name) %>% filter(year == max(year)) %>% ungroup()
  lv <- levels(dp$country_name)
  others <- setdiff(lv, "South Africa")
  cols <- setNames(rep_len(c("#693e23","#8f8844","#db6a11","#ba1a20","#4492a0","#a9a9a9"), length(others)), others)
  cols["South Africa"] <- OLW_SA
  p <- ggplot(dp, aes(year, stat, colour = country_name)) +
    geom_line(linewidth = 1.2) +
    geom_vline(xintercept = 2009, linetype = "dashed", colour = "grey70") +
    geom_text_repel(data = labs36, aes(label = country_name), size = 3.3, nudge_x = 1.5,
                    direction = "y", segment.colour = "grey70") +
    scale_colour_manual(values = cols) +
    scale_y_continuous(labels = scales::percent_format(scale = 1)) +
    scale_x_continuous(expand = expansion(mult = c(0.02, 0.2))) +
    labs(x = NULL, y = "Poverty headcount ratio (% of population)", caption = CAP("World Bank (2020)")) +
    theme_olw()
  sv("figure-36-1.jpg", p)
})

# =============================================================================
# PART B – the 4 new figures, built from scratch in OLW colour
# =============================================================================

## 9.1 – Timeline of Jerusalem's rulers
run("9.1", {
  jl <- tribble(
    ~ruler, ~start, ~end, ~class,
    "Canaanite", -2000, -1550, "Non-Abrahamic",
    "Egyptian New Kingdom", -1550, -1180, "Non-Abrahamic",
    "Jebusite", -1180, -1003, "Non-Abrahamic",
    "United Israelite Monarchy", -1003, -930, "Hebrew or Jewish",
    "Kingdom of Judah", -930, -586, "Hebrew or Jewish",
    "Neo-Assyrian", -732, -640, "Non-Abrahamic",
    "Neo-Babylonian (1)", -640, -609, "Non-Abrahamic",
    "Egyptian Late Dynasty", -609, -605, "Non-Abrahamic",
    "Neo-Babylonian (2)", -605, -539, "Non-Abrahamic",
    "Persian (Achaemenid)", -539, -332, "Non-Abrahamic",
    "Diadochi (Ptolemaic/Seleucid)", -332, -140, "Non-Abrahamic",
    "Hasmonean Kingdom", -140, -63, "Hebrew or Jewish",
    "Roman", -63, 324, "Non-Abrahamic",
    "Byzantine (1)", 324, 614, "Christian",
    "Persian (Sassanid)", 614, 629, "Non-Abrahamic",
    "Byzantine (2)", 629, 638, "Christian",
    "Rashidun", 638, 661, "Muslim",
    "Umayyad", 661, 750, "Muslim",
    "Abbasid (1)", 750, 868, "Muslim",
    "Tulunid", 868, 905, "Muslim",
    "Abbasid (2)", 905, 935, "Muslim",
    "Ikhshidid", 935, 969, "Muslim",
    "Fatimid (1)", 969, 1073, "Muslim",
    "Seljuq", 1073, 1098, "Muslim",
    "Fatimid (2)", 1098, 1099, "Muslim",
    "Kingdom of Jerusalem (Crusaders)", 1099, 1187, "Christian",
    "Ayyubid (1)", 1187, 1229, "Muslim",
    "Kingdom of Jerusalem (2)", 1229, 1244, "Christian",
    "Ayyubid (2)", 1244, 1260, "Muslim",
    "Mamluk", 1260, 1516, "Muslim",
    "Ottoman", 1516, 1917, "Muslim",
    "British", 1917, 1948, "Christian",
    "Israel and Jordan", 1948, 1967, "Division - Israel and Jordan",
    "Israel", 1967, 2025, "Hebrew or Jewish")
  jl <- jl %>% mutate(row = rev(seq_len(n())), ruler = factor(ruler, levels = ruler[order(row)]))
  cls_cols <- c("Non-Abrahamic"="#693e23","Hebrew or Jewish"="#c29500","Christian"="#4492a0",
                "Muslim"="#8f8844","Division - Israel and Jordan"="#ba1a20")
  p <- ggplot(jl) +
    geom_vline(xintercept = c(1099, 1291), linetype = "dashed", colour = "grey55") +
    geom_segment(aes(x = start, xend = end, y = row, yend = row, colour = class), linewidth = 3.4) +
    geom_text(aes(x = pmin(start, end), y = row, label = ruler), hjust = 1, nudge_x = -25, size = 2.7, colour = "#373838") +
    scale_colour_manual(values = cls_cols, name = NULL) +
    scale_x_continuous(limits = c(-2700, 2200), breaks = seq(-2000, 2000, 1000),
                       labels = function(b) ifelse(b < 0, paste0(abs(b)," BCE"), ifelse(b == 0, "0", paste0(b," CE")))) +
    labs(x = NULL, y = NULL, caption = CAP("Wikipedia – 'Timeline of Jerusalem'; dashed lines: Crusades")) +
    theme_olw() +
    theme(legend.position = "bottom", axis.text.y = element_blank(), panel.grid.major.y = element_blank())
  sv("figure-9-1.jpg", p, w = 10, h = 9)
})

## 12.1 – Top Atlantic slave routes
run("12.1", {
  world <- ne_countries(scale = "medium", returnclass = "sf")
  org <- tribble(
    ~region, ~lon, ~lat,
    "Senegambia", -16.5, 14.5, "Sierra Leone", -13, 8.5, "Windward Coast", -7.5, 5.5,
    "Gold Coast", -1, 5, "Bight of Benin", 2.5, 6, "Bight of Biafra", 7.5, 4,
    "West Central Africa", 13, -8, "Southeast Africa", 38, -18)
  dst <- tribble(~place, ~lon, ~lat, "Caribbean", -72, 18, "Brazil", -41, -13)
  routes <- tribble(
    ~from, ~to, ~voyages,
    "West Central Africa","Brazil", 11, "West Central Africa","Caribbean", 6,
    "Bight of Benin","Brazil", 5, "Bight of Biafra","Caribbean", 6,
    "Gold Coast","Caribbean", 4, "Senegambia","Caribbean", 3,
    "Sierra Leone","Caribbean", 3, "Southeast Africa","Brazil", 3,
    "Windward Coast","Caribbean", 2, "Bight of Benin","Caribbean", 4) %>%
    left_join(org, by = c("from"="region")) %>% rename(x = lon, y = lat) %>%
    left_join(dst, by = c("to"="place")) %>% rename(xend = lon, yend = lat)
  p <- ggplot() +
    geom_sf(data = world, fill = OLW_LAND, colour = "white") +
    coord_sf(xlim = c(-95, 55), ylim = c(-40, 42)) +
    geom_curve(data = routes %>% filter(to == "Caribbean"),
               aes(x = x, y = y, xend = xend, yend = yend, linewidth = voyages),
               curvature = -0.25, colour = "#693e23", alpha = 0.7,
               arrow = arrow(length = unit(0.015, "npc"), type = "closed")) +
    geom_curve(data = routes %>% filter(to == "Brazil"),
               aes(x = x, y = y, xend = xend, yend = yend, linewidth = voyages),
               curvature = 0.25, colour = "#8f8844", alpha = 0.8,
               arrow = arrow(length = unit(0.015, "npc"), type = "closed")) +
    geom_point(data = org, aes(lon, lat), size = 1.6, colour = "#693e23") +
    geom_point(data = dst, aes(lon, lat), size = 2.2, colour = "#ba1a20") +
    geom_text_repel(data = org, aes(lon, lat, label = region), size = 3.2, colour = "#373838") +
    geom_text_repel(data = dst, aes(lon, lat, label = place), size = 3.6, colour = "#ba1a20", fontface = "bold") +
    scale_linewidth(range = c(0.4, 2.6), guide = "none") +
    labs(x = NULL, y = NULL, caption = CAP("Manning and Liu (2019); route widths approximate voyage volumes")) +
    theme_olw_map()
  sv("figure-12-1.jpg", p)
})

## 3.1 – How individualised norms spread through migration (schematic)
run("3.1", {
  ramp <- colorRampPalette(c("#693e23", "#c29500", "#eccba7"))  # collectivism -> individualism
  bar <- function(x0, y0, w = 3.2, h = 0.7, nseg = 40) {
    tibble(xmin = seq(x0, x0 + w, length.out = nseg + 1)[-(nseg+1)],
           xmax = seq(x0, x0 + w, length.out = nseg + 1)[-1],
           ymin = y0 - h/2, ymax = y0 + h/2, fillcol = ramp(nseg))
  }
  stages <- tibble(x0 = c(0.3, 1.6, 2.9, 4.2), y0 = c(1, 2.4, 3.8, 5.2))
  bars <- bind_rows(lapply(seq_len(nrow(stages)), function(i) bar(stages$x0[i], stages$y0[i]) %>% mutate(stage = i)))
  dash <- stages %>% mutate(xmin = x0 + 3.2*0.55, xmax = x0 + 3.2, ymin = y0 - 0.45, ymax = y0 + 0.45)
  arr <- stages %>% mutate(x0n = lead(x0), y0n = lead(y0)) %>% slice(1:3) %>%
    mutate(x = x0 + 3.2*0.78, xend = x0n + 3.2*0.78, y = y0 + 0.45, yend = y0n - 0.45)
  ann <- tibble(
    x = c(4.2, 6.0, 2.4),
    y = c(0.95, 3.1, 5.5),
    label = c("A group of individualists leaves the core\nand founds new settlements (9500 BP)",
              "The most individualistic groups repeatedly\nbreak up and found new settlements\nnorthwards (9500–5500 BP)",
              "In the northern periphery, the distribution\nof norms is strongly biased towards\nindividualism (5500 BP)"))
  legbar <- bar(1.5, -0.6, w = 4, h = 0.45, nseg = 60)
  p <- ggplot() +
    geom_rect(data = bars, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, fill = fillcol)) +
    scale_fill_identity() +
    geom_rect(data = dash, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax),
              fill = NA, colour = "#373838", linetype = "dashed", linewidth = 0.6) +
    geom_segment(data = arr, aes(x = x, y = y, xend = x, yend = yend),
                 arrow = arrow(length = unit(0.025, "npc"), type = "closed"), linewidth = 0.7, colour = "#373838") +
    geom_label(data = ann, aes(x, y, label = label), size = 3.1, colour = "#693e23",
               fill = OLW_BG, label.size = 0.2, hjust = 0.5, lineheight = 0.95) +
    annotate("segment", x = -0.3, xend = -0.3, y = 0.5, yend = 5.9,
             arrow = arrow(length = unit(0.02, "npc")), colour = "#373838") +
    annotate("text", x = -0.55, y = 5.9, label = "North", hjust = 1, fontface = "bold", colour = "#693e23") +
    annotate("text", x = -0.55, y = 0.6, label = "South", hjust = 1, fontface = "bold", colour = "#693e23") +
    annotate("segment", x = 0, xend = 8, y = -0.05, yend = -0.05,
             arrow = arrow(length = unit(0.02, "npc")), colour = "#373838") +
    annotate("text", x = 4, y = -0.3, label = "Degree of individualism", colour = "#693e23") +
    geom_rect(data = legbar, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, fill = fillcol)) +
    annotate("text", x = 1.3, y = -0.6, label = "Collectivism", hjust = 1, size = 3.2, colour = "#693e23") +
    annotate("text", x = 5.7, y = -0.6, label = "Individualism", hjust = 0, size = 3.2, colour = "#693e23") +
    coord_cartesian(xlim = c(-1.8, 8.5), ylim = c(-1.1, 6.2)) +
    labs(caption = CAP("After Olsson and Paik (2016)")) +
    theme_void() +
    theme(plot.background = element_rect(fill = OLW_BG, colour = NA),
          panel.background = element_rect(fill = OLW_BG, colour = NA),
          plot.caption = element_text(size = 8, colour = "#693e23", hjust = 1, face = "italic", margin = margin(t = 8)))
  sv("figure-3-1.jpg", p, w = 10, h = 7)
})

## 8.1 – Africa's five ecological zones
## Built separately from the FAO Global Ecological Zones (2010) shapefile by
## `build_fig8_1.R`, which writes figure-8-1.jpg straight into OLWTEF/images/.
## (The earlier stylised-rectangle approximation was removed; do not regenerate it here.)

cat("\n_olw now has:\n  ", paste(sort(list.files(OUTDIR)), collapse = "\n   "), "\n")
