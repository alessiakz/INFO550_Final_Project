here::i_am("code/00_clean_data.R") #identifies root directory location
absolute_path_to_data <- here::here("raw_data/owid-covid-data.csv")
data_raw <- read.csv(absolute_path_to_data, header = TRUE)

library(tidyverse)

data_clean <- data_raw %>% 
  select(location, date, total_vaccinations, people_vaccinated, people_fully_vaccinated, total_boosters, total_vaccinations_per_hundred, people_vaccinated_per_hundred) %>%  #selecting variables of interest
  filter(date == "9/9/2022") %>% #filtering by latest date
  filter(!is.na(total_vaccinations)) #removing missing values

saveRDS(
  data_clean,
  file = here::here("output/data_clean.rds"))