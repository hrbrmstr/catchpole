## code to prepare `DATASET` dataset goes here

library(sf)
library(xml2)
library(hrbrthemes)
library(tidyverse)

delegates_sf <- st_read("https://rud.is/dl/delegates.geojson", stringsAsFactors = FALSE)



usethis::use_data(delegates_sf, internal = TRUE)
