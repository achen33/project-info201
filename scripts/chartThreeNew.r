# Chart Three: Scatterplot

# Purpose (To be inserted in index.Rmd): 
# Compare votes for Donald Trump and Joe Biden by counties within each state for 
# 2020 election

# Load needed packages: 
library(tidyverse)
library(ggplot2)

# Load data
county_statistics <- read.csv("~/Documents/UW/junior/INFO 201/project-info201/data/county_statistics (1).csv")
View(county_statistics)

# Chart Script 
votes_2020_data <- county_statistics %>%
  group_by(state) %>% 
  summarize(voted_trump = sum(votes20_Donald_Trump, na.rm = TRUE),
            voted_biden = sum(votes20_Joe_Biden, na.rm = TRUE))

votes_2020 <- ggplot(data = votes_2020_data) +
  geom_point(mapping = aes(x = voted_trump,
                           y = voted_biden, 
                           color = state)) +
  ggtitle("Comparison of State Votes for Trump vs. Biden")
  
votes_2020



