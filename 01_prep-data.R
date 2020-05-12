library(tidyverse)
library(readxl)
library(janitor)

# https://www.un.org/en/development/desa/population/migration/data/estimates2/data/UN_MigrantStockByOriginAndDestination_2017.xlsx
mdo <- read_excel(here::here("data-input/UN_MigrantStockByOriginAndDestination_2017.xlsx"), 2, skip = 15)
names(mdo)[1:6] <- c("year", "sort_order", "region", "notes", "code", "type")

cntrs <- read_tsv(here::here("data-input/un_list.tsv")) %>%
  clean_names()
# from https://unstats.un.org/unsd/methodology/m49/overview/

countrycodes_from_data <- mdo %>%
  distinct(region, code) %>%
  rename(orig_name = region, orig_code = code)

mdl_all <- mdo %>%
  rename(destination_name = region, destination_code = code) %>%
  pivot_longer(cols = 7:ncol(.), names_to = "origin_name") %>%
  select(-sort_order) %>%
  mutate(destination_code = as.character(destination_code)) %>%
  left_join(cntrs %>% select(destination_region_name = region_name,
                             destination_sub_region_name = sub_region_name,
                             destination_intermediate_region_name = intermediate_region_name,
                             m49_code),
            by = c("destination_code" = "m49_code")) %>%
  left_join(countrycodes_from_data, by = c("origin_name" = "orig_name")) %>%
  mutate(orig_code = as.character(orig_code) %>%
           str_pad(3, pad = "0")) %>%
  left_join(cntrs %>% select(origin_region_name = region_name,
                             origin_sub_region_name = sub_region_name,
                             origin_intermediate_region_name = intermediate_region_name,
                             country_or_area, m49_code),
            by = c("orig_code" = "m49_code")) %>%
  mutate(value = as.numeric(value))

mdl <- mdl_all %>%
  filter(!is.na(origin_region_name), !is.na(destination_region_name))

skimr::skim(mdl)

mdl_all %>% filter(is.na(origin_region_name)) %>% distinct(origin_name)
mdl %>% filter(is.na(origin_region_name)) %>% distinct(origin_name)

mds <- mdl %>%
  mutate(origin = if_else(!is.na(origin_intermediate_region_name),
                          origin_intermediate_region_name,
                          origin_sub_region_name),
         destination = if_else(!is.na(destination_intermediate_region_name),
                          destination_intermediate_region_name,
                          destination_sub_region_name)) %>%
  group_by(year, origin, destination) %>%
  summarise(value = sum(value, na.rm = T)) %>%
  filter(year %in% c(2015, 2017)) %>%
  pivot_wider(names_from = year, values_from = value) %>%
  mutate(value = `2017` - `2015`)

write_rds(mds, here::here("data-processed/orig-dest-new.rds"))

