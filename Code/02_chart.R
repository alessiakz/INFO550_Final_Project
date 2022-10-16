#setting root directory
here::i_am("code/02_chart.R")

#making dataframe from the saved data object
data <- readRDS(
  file = here::here("output/data_clean.rds")
)

#loading packages
library(ggplot2)
library(tidyverse)

bar <- data_clean %>%
  select(location, total_vaccinations, total_vaccinations_per_hundred, people_vaccinated,
         people_vaccinated_per_hundred, people_fully_vaccinated, total_boosters) %>%  #selecting values of interest
  filter(location == "Africa" | location == "Asia" | location == "Europe" | location == "North America" |
           location == "Oceania" | location == "South America" | location == "World") %>%  #selecting continents and world online
  ggplot(aes(x=location, y = people_vaccinated_per_hundred)) + #selecting x and y variables
  geom_col(aes(fill = location)) + #creating bar chart with fill by location variable
  scale_fill_brewer(palette = "Set2") + #setting color palette
  theme_minimal() + #setting minimal theme
  theme(axis.title.x=element_blank(), legend.position = "none") + #removing x axis and legend
  ylab("Total People Vaccinated per Hundred People") + #adding y axis label
  ggtitle("Total People Vaccinated for COVID-19 per Hundred People by Continent")

ggsave( #specific for ggplot
  here::here("output/barchart.png"), #name and location
  plot = last_plot(), #set what you want to save ie. the name of the object
  device = "png" #what file type
)