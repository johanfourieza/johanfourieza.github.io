# Figure 8.1 - Africa's five ecological zones, from the FAO Global Ecological Zones
# (GEZ 2010) shapefile. Replaces the earlier stylised-rectangle approximation.
# Source data (CC, FAO): downloaded + cached locally; processed Africa layer cached as rds.

suppressWarnings(suppressMessages({
  library(sf); library(ggplot2); library(dplyr)
  library(rnaturalearth); library(rnaturalearthdata)
}))
sf::sf_use_s2(FALSE)

ROOT   <- "C:/Users/johanf/Dropbox/0Claude0/4JohanFourie/Website"
SCRATCH<- "C:/Temp/gez"
SHP    <- file.path(SCRATCH, "gez_2010_wgs84.shp")
URL    <- "https://storage.googleapis.com/fao-maps-catalog-data/uuid/2fb209d0-fd34-4e5e-a3d8-a13c241eb61b/resources/gez2010.zip"
CACHE  <- file.path(ROOT, "OLWTEF/ingest/_cache"); dir.create(CACHE, showWarnings = FALSE, recursive = TRUE)
RDS    <- file.path(CACHE, "africa_gez.rds")

OLW_BG <- "#f7f5f2"
CAP <- function(src) paste0("Source: ", src, " • Visualised: johanfourie.com")
theme_olw_map <- function(base = 13) ggplot2::theme_minimal(base_size = base) %+replace% theme(
  plot.background = element_rect(fill = OLW_BG, colour = NA),
  panel.background = element_rect(fill = OLW_BG, colour = NA),
  panel.grid = element_blank(), axis.text = element_blank(), axis.title = element_blank(),
  plot.caption = element_text(size = 8, colour = "#693e23", hjust = 1, face = "italic", margin = margin(t = 8)))

# Tropical/Subtropical (and any temperate) FAO classes -> the book's five zones
reclass <- function(g) {
  z <- rep(NA_character_, length(g))
  z[grepl("rainforest|moist forest", g)]            <- "Forest"
  z[grepl("dry forest|shrubland|steppe", g)]        <- "Savannah"
  z[grepl("desert", g)]                              <- "Desert"
  z[grepl("mountain system", g)]                     <- "Highlands"
  z[grepl("humid forest", g)]                        <- "Temperate"
  # subtropical/temperate dry forest reads as Mediterranean/Cape temperate, not savannah
  z[grepl("Subtropical dry forest|Temperate .*forest|Temperate steppe", g)] <- "Temperate"
  z
}

if (file.exists(RDS)) {
  zones <- readRDS(RDS); cat("Loaded cached Africa zones.\n")
} else {
  if (!file.exists(SHP)) {
    dir.create(SCRATCH, showWarnings = FALSE, recursive = TRUE)
    zipf <- file.path(SCRATCH, "gez2010.zip")
    cat("Downloading FAO GEZ 2010 ...\n"); download.file(URL, zipf, mode = "wb", quiet = TRUE)
    unzip(zipf, exdir = SCRATCH)
  }
  g <- st_read(SHP, quiet = TRUE)
  if (is.na(st_crs(g))) st_crs(g) <- 4326
  g$zone <- reclass(as.character(g$gez_name))
  cat("Class -> zone mapping:\n"); print(table(g$gez_name, g$zone, useNA = "ifany"))
  g <- g[!is.na(g$zone), ]
  africa <- ne_countries(scale = "medium", continent = "Africa", returnclass = "sf") |> st_make_valid()
  africa_u <- st_union(africa)
  bb <- st_bbox(africa_u)
  g <- suppressWarnings(st_crop(st_make_valid(g), bb))
  g <- suppressWarnings(st_intersection(g, africa_u))
  zones <- g |> group_by(zone) |> summarise(.groups = "drop")   # dissolve per zone
  saveRDS(zones, RDS); cat("Cached processed Africa zones.\n")
}

africa <- ne_countries(scale = "medium", continent = "Africa", returnclass = "sf")
zlev <- c("Desert","Savannah","Forest","Highlands","Temperate")
zcols <- c(Desert = "#eccba7", Savannah = "#c29500", Forest = "#556b2f",
           Highlands = "#693e23", Temperate = "#4492a0")
zones$zone <- factor(zones$zone, levels = zlev)

p <- ggplot() +
  geom_sf(data = zones, aes(fill = zone), colour = NA) +
  geom_sf(data = africa, fill = NA, colour = "white", linewidth = 0.12) +
  scale_fill_manual(values = zcols, breaks = zlev, name = "Ecological zone", drop = FALSE) +
  coord_sf(xlim = c(-19, 52), ylim = c(-36, 38), expand = FALSE) +
  labs(caption = CAP("FAO Global Ecological Zones (2010)")) +
  theme_olw_map() + theme(legend.position = "right")

out <- file.path(ROOT, "OLWTEF/images/figure-8-1.jpg")
ggsave(out, p, width = 10, height = 6, dpi = 300, bg = OLW_BG)
cat("Saved", out, "\n")
