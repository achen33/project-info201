# Chart One: Line Chart (2) 

# Purpose (To be inserted in index.Rmd:
# Compare voting numbers in the 2016 election versus the 2020 election 

# Load needed packages 
library(tidyverse)
library(ggplot2)

# Load data
county_statistics <- read.csv("data/county_statistics (1).csv")
View(county_statistics)

# Chart Script (1)
line_2016_data <- county_statistics %>% 
  group_by(state) %>% 
  mutate(proportion_voted_2016 = total_votes16 / VotingAgeCitizen)
  
line_2016 <- ggplot(data = line_2016_data) + 
  geom_line(mapping = aes(x = state, 
                          y = proportion_voted_2016, 
                          color = "State Population Voted")) +
  ggtitle("Proportions of Voted Voting Age Citizen by State") +
  labs(x = "States", y = "Voted Proportions")

line_2016

# Chart Script (2)
line_2020_data <- 
  county_statistics %>% 
  group_by(state) %>% 
  mutate(proportion_voted_2020 = total_votes20 / VotingAgeCitizen)

line_2020 <- ggplot(data = line_2020_data) + 
  geom_line(mapping = aes(x = state, 
                          y = proportion_voted_2020, 
                          color = "State Population Voted")) +
  ggtitle("Proportions of Voted Voting Age Citizen by State") +
  labs(x = "States", y = "Voted Proportions")

line_2020


--- new ---
  
  
# Chart Script (1)
line_2016_data <- county_statistics %>% 
  group_by(state) %>% 
  pull(total_votes16)

line_2016 <- ggplot(data = line_2016_data) + 
  geom_line(mapping = aes(x = state, 
                          y = proportion_voted_2016, 
                          color = "State Population Voted")) +
  ggtitle("Proportions of Voted Voting Age Citizen by State") +
  labs(x = "States", y = "Voted Proportions")

line_2016

# Chart Script (2)
line_2020_data <- 
  county_statistics %>% 
  group_by(state) %>% 
  mutate(proportion_voted_2020 = total_votes20 / VotingAgeCitizen)

line_2020 <- ggplot(data = line_2020_data) + 
  geom_line(mapping = aes(x = state, 
                          y = proportion_voted_2020, 
                          color = "State Population Voted")) +
  ggtitle("Proportions of Voted Voting Age Citizen by State") +
  labs(x = "States", y = "Voted Proportions")

line_2020

   
  