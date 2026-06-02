# Regenerate the 5 figures that fell back to curated JPGs, in the same theme_minimal style,
# using only LOCAL data (OLWEF/Data) + the bundled public rnaturalearth basemaps.
# Fixes vs ScriptGraphs.R: shim the undefined custom theme; no-op the pacman p_load calls
# (their packages aren't actually used); correct the Maddison rename (countrycode, not
# i_countrycode). Outputs into OLWEF/Graphs/_regen/ ; ggsave is shadowed so originals are safe.

OLWEF  <- "C:/Users/johanf/Dropbox/0Claude0/4JohanFourie/OLWEF"
OUTDIR <- file.path(OLWEF, "Graphs", "_regen")
dir.create(OUTDIR, showWarnings = FALSE, recursive = TRUE)
setwd(OLWEF)

for (p in c("tidyverse","reshape2","readxl","scales","ggrepel","ggpubr","janitor",
            "sf","rnaturalearth","rnaturalearthdata","countrycode"))
  suppressWarnings(suppressMessages(library(p, character.only = TRUE)))

ggsave <- function(filename, ...) ggplot2::ggsave(file.path(OUTDIR, basename(filename)), ...)
theme_minimalistic_bw <- function(...) ggplot2::theme_minimal()   # shim for undefined theme
p_load <- function(...) invisible(NULL)                            # no-op (pacman absent)

run <- function(label, expr) {
  before <- list.files(OUTDIR)
  res <- try(expr, silent = TRUE)
  after <- setdiff(list.files(OUTDIR), before)
  if (inherits(res, "try-error"))
    cat(sprintf("  FAIL  %-8s %s\n", label, sub("\n.*", "", conditionMessage(attr(res, "condition")))))
  else
    cat(sprintf("  ok    %-8s -> %s\n", label, paste(after, collapse = ", ")))
}

## ---- Figure 1.1 : world population by poverty threshold (stacked area) ----
run("1.1", {
  poverty_data <- read_excel("Data/poverty.xlsx")
  colnames(poverty_data) <- c("Entity","Code","Year",
                              "Above_30","Above_30_Annotations",
                              "10_to_30","10_to_30_Annotations",
                              "5_to_10","5_to_10_Annotations",
                              "1.90_to_5","1.90_to_5_Annotations",
                              "Below_1.90","Below_1.90_Annotations")
  poverty_data <- poverty_data[, c("Entity","Year","Above_30","10_to_30","5_to_10","1.90_to_5","Below_1.90")]
  poverty_data$total <- rowSums(poverty_data[, c("Above_30","10_to_30","5_to_10","1.90_to_5","Below_1.90")])
  poverty_data$Above_30_pct    <- poverty_data$Above_30    / poverty_data$total * 100
  poverty_data$`10_to_30_pct`  <- poverty_data$`10_to_30`  / poverty_data$total * 100
  poverty_data$`5_to_10_pct`   <- poverty_data$`5_to_10`   / poverty_data$total * 100
  poverty_data$`1.90_to_5_pct` <- poverty_data$`1.90_to_5` / poverty_data$total * 100
  poverty_data$Below_1.90_pct  <- poverty_data$Below_1.90  / poverty_data$total * 100
  melted_data <- melt(poverty_data, id.vars = c("Entity","Year"),
                      measure.vars = c("Above_30_pct","10_to_30_pct","5_to_10_pct","1.90_to_5_pct","Below_1.90_pct"))
  melted_data <- melted_data %>% filter(Entity == "World")
  figure1 <- ggplot(melted_data, aes(x = Year, y = value, fill = variable)) +
    geom_area() +
    scale_fill_manual(values = c("Above_30_pct"="#d9d9d9","10_to_30_pct"="#bdbdbd",
                                 "5_to_10_pct"="#969696","1.90_to_5_pct"="#636363","Below_1.90_pct"="#252525"),
                      labels = c("Above $30 a day","$10-$30 a day","$5-$10 a day","$1.90-$5 a day","Below $1.90 a day")) +
    labs(y = "Percentage", fill = "") +
    theme_minimal() +
    theme(legend.position = "bottom", legend.title = element_blank(),
          plot.margin = margin(0,0,0,0), panel.grid = element_blank())
  ggsave("Graphs/figure1.jpg", plot = figure1, width = 7.67, height = 5.70, dpi = 300, bg = "white")
})

## ---- shared Maddison frame for 23.1 and 26 (FIXED rename) ----
df_mad <- read.csv("Data/maddison_project_database.csv") %>% janitor::clean_names() %>% as_tibble()
df_mad <- df_mad %>% select(countrycode, country, year, cgdppc, rgdpnapc, pop, i_cig, i_bm)
df_mad <- df_mad %>%
  pivot_longer(cgdppc:pop, names_to = "indicator_name", values_to = "stat") %>%
  select(-i_cig, -i_bm) %>%
  mutate(indicator_code = indicator_name,
         indicator_name = recode(indicator_code, pop = "Population",
                                 cgdppc = "Real GDP per capita in 2011US$ (for income comparisons)",
                                 rgdpnapc = "Real GDP per capita in 2011US$ (for growth comparisons)")) %>%
  rename(country_code = countrycode, country_name = country) %>%   # FIX: was i_countrycode
  mutate(year = as.numeric(year))

## ---- Figure 23.1 : US vs USSR GDP per capita ----
run("23.1", {
  d <- df_mad %>% filter(country_name %in% c("United States","Former USSR"),
                         indicator_code == "cgdppc", year >= 1885)
  figure23a <- ggplot(d) +
    geom_line(aes(year, stat, colour = country_name, lty = country_name), cex = 1) +
    scale_y_continuous(labels = scales::comma_format(big.mark = " ")) +
    scale_color_grey(end = .5) +
    labs(y = "GDP per capita (constant 2010 US$)", x = "Year",
         caption = "Source: Maddison Project Database (2024)", lty = "", colour = "") +
    theme_minimal() + theme(legend.position = "bottom", panel.grid.minor = element_blank())
  ggsave("Graphs/figure23a.jpg", plot = figure23a, width = 7.67, height = 5.70, dpi = 300, bg = "white")
})

## ---- Figure 26 : GDP per capita 1900 vs 2000 ----
run("26", {
  d1900 <- df_mad %>% filter(year >= 1890, year <= 1910) %>% group_by(country_name) %>%
    filter(year == median(year)) %>% ungroup() %>% mutate(time = 1900)
  d2000 <- df_mad %>% filter(year >= 1990, year <= 2010) %>% group_by(country_name) %>%
    filter(year == median(year)) %>% ungroup() %>% mutate(time = 2000)
  comp <- rbind(d2000, d1900) %>% arrange(country_name, time) %>%
    select(!year) %>% pivot_wider(names_from = time, values_from = stat) %>%
    mutate(continent = countrycode(country_code, origin = "iso3c", destination = "continent"),
           country_name = str_remove(country_name, "\\(.*"))
  figure26 <- comp %>% filter(indicator_code == "cgdppc", continent != "NA", country_code != "ARG") %>%
    ggplot(aes(`1900`, `2000`, label = country_name, shape = continent)) +
    geom_point(cex = 2.5) + geom_text_repel() +
    geom_label_repel(data = comp %>% filter(indicator_code == "cgdppc", continent != "NA", country_code == "ARG"),
                     aes(`1900`, `2000`, label = country_name, shape = continent)) +
    scale_shape_manual(values = seq(15, 20, by = 1)) +
    scale_x_continuous(labels = scales::dollar_format(big.mark = " ")) +
    scale_y_continuous(labels = scales::dollar_format(big.mark = " "), limits = c(0, 60000)) +
    labs(x = "GDP per capita in 1900", y = "GDP per capita in 2000", shape = "Continent",
         caption = "Source: Maddison Project Database (2024)") +
    theme_minimal() + theme(legend.position = "none")
  ggsave("Graphs/figure26.jpg", plot = figure26, width = 7.67, height = 5.70, dpi = 300, bg = "white")
})

## ---- Figure 5.1 : Bantu migration map ----
run("5.1", {
  world <- ne_countries(scale = "medium", returnclass = "sf")
  aac  <- read_rds("Data/arrow_areas_coords.rds")
  aac2 <- read_rds("Data/arrow_areas_2_coords.rds")
  aac3 <- read_rds("Data/arrow_areas_3_coords.rds") %>% rename(value1 = value)
  arrow_directions_2 <- cbind(aac2, aac3) %>% as_tibble() %>% select(-value, -value1)
  yaonde <- aac %>% filter(value == "yaounde, cameroon")
  arrow_directions_1 <- aac %>% filter(value != "yaounde, cameroon") %>%
    mutate(lat2 = yaonde$lat1, long2 = yaonde$long1) %>% select(-value)
  bm_labels <- tibble(x = c(22, 36, 8), y = c(-3, -25, 9),
                      label = c("Movement of Bantu speakers \n by 1000 BCE",
                                "Further movement \n by 300 CE", "Bantu homeland \n by 3000 BCE"))
  figure5 <- ggplot(world) +
    geom_point(data = aac, aes(long1, lat1)) +
    geom_sf(colour = "white") +
    coord_sf(ylim = c(-35, 10), xlim = c(-10, 50)) +
    geom_curve(data = arrow_directions_1, aes(y = lat2, x = long2, yend = lat1, xend = long1),
               curvature = -.3, cex = 1.2, arrow = arrow(length = unit(0.02, "npc"), type = "closed"),
               lty = 1, colour = "#a9a9a9") +
    geom_curve(data = arrow_directions_2, aes(y = lat1, x = long1, yend = lat2, xend = long2),
               curvature = .3, cex = 1.2, arrow = arrow(length = unit(0.02, "npc"), type = "closed"), lty = 2) +
    geom_point(data = yaonde, aes(long1, lat1), shape = 19, cex = 7) +
    geom_text_repel(data = bm_labels, aes(x, y, label = label), size = 5) +
    labs(x = "", y = "", caption = "Source: Wikipedia - 'Bantu expansion'") +
    theme_void()
  ggsave("Graphs/figure5.jpg", plot = figure5, width = 7.67, height = 5.70, dpi = 300, bg = "white")
})

## ---- Figure 35.1 : share of deaths from HIV/AIDS, 2000 (world map) ----
run("35.1", {
  sda <- read_csv("Data/share-deaths-aids.csv", show_col_types = FALSE) %>% as_tibble() %>%
    rename(share_death = `Deaths - HIV/AIDS - Sex: Both - Age: All Ages (Percent)`) %>%
    filter(Year == 2000, !is.na(Code)) %>%
    mutate(iso_a3 = countrycode(Entity, origin = "country.name", destination = "iso3c"))
  world <- ne_countries(scale = "medium", returnclass = "sf")
  df_sf <- inner_join(sda, world, by = "iso_a3")
  figure35a <- ggplot(df_sf) +
    borders() +
    geom_sf(aes(fill = share_death, geometry = geometry)) +
    scale_fill_gradient(low = "gray97", high = "gray10",
                        labels = scales::percent_format(scale = 1), breaks = seq(0, 60, by = 10)) +
    theme_minimal() + theme(legend.position = "bottom") +
    coord_sf(ylim = c(-50, 70), xlim = c(-120, 150)) +
    guides(fill = guide_colorbar(barwidth = 20, barheight = 0.5, title.position = "top", title.hjust = .5)) +
    labs(caption = "Source: IHME, Global Burden of Disease (2020)", x = NULL, y = NULL,
         fill = "Share of deaths from HIV/Aids, 2000")
  ggsave("Graphs/figure35a.jpg", plot = figure35a, width = 7.67, height = 5.70, dpi = 300, bg = "white")
})

cat("\n_regen now contains:\n  ", paste(sort(list.files(OUTDIR)), collapse = "\n   "), "\n")
