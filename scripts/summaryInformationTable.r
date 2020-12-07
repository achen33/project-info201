library(readxl)
library(tidyr)
library(dplyr)
library(readr)
library(tidyverse)
library(lintr)
library(styler)

data <- read_csv("data/county_statistics (1).csv")
View(data)

state_votes <- data %>%
  select(state, total_votes20, votes20_Donald_Trump, votes20_Joe_Biden) %>%
  group_by(state) %>%
  summarise(
    votes_Joe_Biden = sum(votes20_Joe_Biden, na.rm = TRUE),
    votes_donald_trump = sum(votes20_Donald_Trump, na.rm = TRUE)
  ) %>%
  mutate(vote_diff = abs(votes_donald_trump - votes_Joe_Biden))

View(state_votes)

# Version Control
lint("summaryInformationTable.r")
style_file("summaryInformationTable.r")
