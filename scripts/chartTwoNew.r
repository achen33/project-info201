# Chart Two: Stacked Bar Chart  

# Purpose (To be inserted in index.Rmd):
# Shows by state, the proportions that racial groups amounts to of the total pop

# Load needed packages
library(tidyverse)
library(ggplot2)

# Load data 
county_statistics <- read.csv("~/Documents/UW/junior/INFO 201/project-info201/data/county_statistics (1).csv")
View(county_statistics)

# Chart Script 
race_prop_data <- county_statistics %>% 
  select(state, Hispanic, White, Black, Native, Asian, Pacific) %>%
  gather(key = race, value = population, -state)

race_prop <- ggplot(race_prop_data) +
  geom_col(mapping = aes(x = state, 
                         y = population, 
                         fill = race)) +
  ggtitle("Racial Proportions of State Populations")

race_prop
  