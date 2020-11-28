# Chart Three: Scatterplot

# Purpose (To be inserted in index.Rmd):
# Compare votes for Donald Trump and Joe Biden by within major swing states for
# 2020 election

# Load needed packages:
library(tidyverse)
library(ggplot2)
library(lintr)
library(styler)

# Load data
county_statistics <- read.csv("data/county_statistics (1).csv")
View(county_statistics)

# Chart Script
votes_2020_data <- county_statistics %>%
  group_by(state) %>%
  filter(state == "AZ" | state == "CO" | state == "FL" | state == "GA"
  | state == "IA" | state == "MI" | state == "NC" | state == "PA"
  | state == "TX" | state == "WI") %>%
  summarize(
    voted_trump = sum(votes20_Donald_Trump, na.rm = TRUE),
    voted_biden = sum(votes20_Joe_Biden, na.rm = TRUE)
  )

votes_2020 <- ggplot(data = votes_2020_data) +
  geom_point(mapping = aes(
    x = voted_trump,
    y = voted_biden,
    color = state
  )) +
  ggtitle("Comparison of State Votes for Trump vs. Biden")

votes_2020

# Version Control
lint("chartThreeNew.r")
style_file("chartThreeNew.r")
