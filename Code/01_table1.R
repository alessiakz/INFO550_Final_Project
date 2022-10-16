#setting root directory
here::i_am("code/01_table1.R")

#making dataframe from the saved data object
data_clean <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(tidyverse)
library(kableExtra)

table1 <- data_clean %>%
  select(location, total_vaccinations, total_vaccinations_per_hundred, people_vaccinated,
         people_vaccinated_per_hundred, people_fully_vaccinated, total_boosters) %>%  #selecting values of interest
  filter(location == "Africa" | location == "Asia" | location == "Europe" | location == "North America" |
           location == "Oceania" | location == "South America" | location == "World") %>%  #selecting continents and world online
  format(big.mark = ",") %>% #formatting large numbers to use "," breaks
  kbl(
    col.names = c("Location",
                  "Total Vaccinations",
                  "Total Vaccinations per Hundred People",
                  "Total People Vaccinated",
                  "Total People Vaccinated per Hundred People",
                  "Total People Fully Vaccinated",
                  "Total Boosters"
    ), #changing column names
    caption = "Table 1: Total COVID-19 Vaccinations by Continent", #adding a title
    align = "c" #aligning all values to center
  ) %>% 
  kable_styling(bootstrap_options = "striped") %>% #adding striping to table
  add_header_above(c(" " = 1, "Total Vaccinations" = 2, "Total People Vaccinated" = 3, " " = 1)) #adding headers above specific sections


saveRDS(
  table1,
  file = here::here("output/table_1.rds")
)