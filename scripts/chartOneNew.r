# Chart One: Bar Chart (2)

# Purpose (To be inserted in index.Rmd):
# Compare voting numbers in the 2016 election versus the 2020 election

# Load needed packages
library(tidyverse)
library(ggplot2)

# Load data
county_statistics <- read.csv("data/county_statistics (1).csv")
View(county_statistics)

# Chart Script (1)
bar_2016_data <- county_statistics %>%
  select(state, total_votes16) %>%
  group_by(state) %>%
  summarize(state_total = sum(total_votes16, na.rm = TRUE)) %>%
  mutate(state_total)

bar_2016 <- ggplot(data = bar_2016_data) +
  geom_col(mapping = aes(x = state, y = state_total)) +
  ggtitle("Total Votes by State in 2016 President Election")

bar_2016

# Chart Script (2)
bar_2020_data <- county_statistics %>%
  select(state, total_votes20) %>%
  group_by(state) %>%
  summarize(state_total = sum(total_votes20, na.rm = TRUE)) %>%
  mutate(state_total)

bar_2020 <- ggplot(data = bar_2020_data) +
  geom_col(mapping = aes(x = state, y = state_total)) +
  ggtitle("Total Votes by State in 2020 President Election")

bar_2020

# Version Control
lint("chartOneNew.r")
style_file("chartOneNew.r")
