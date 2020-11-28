library("dplyr")
library("tidyverse")
library("readr")

county_statistics_1_ <- read_csv("data/county_statistics (1).csv")
View(county_statistics_1_)

summary_info <- list()
# State with the most  % votes for Biden in the 2020 election
summary_info$max_percent_joe <- county_statistics_1_ %>%
  select(state, percentage20_Joe_Biden) %>%
  group_by(state) %>%
  summarise(max_percent = mean(percentage20_Joe_Biden, na.rm = T)) %>%
  filter(max_percent == max(max_percent, na.rm = T)) %>%
  pull(state)
View(max_percent_joe)

# State with the most % votes for Trump in the 2020 election
summary_info$max_percent_trump <- county_statistics_1_ %>%
  select(state, percentage20_Donald_Trump) %>%
  group_by(state) %>%
  summarise(max_percent = mean(percentage20_Donald_Trump, na.rm = T)) %>%
  filter(max_percent == max(max_percent, na.rm = T)) %>%
  pull(state)
View(max_percent_trump)

# state with the most black population
summary_info$max_race_pop_black <- county_statistics_1_ %>%
  mutate(black_percent = Black / TotalPop * 100) %>%
  select(state, county, TotalPop, Men, Women, Hispanic, White, Black, Native,
         Asian, Pacific, black_percent) %>%
  group_by(state) %>%
  summarise(max_pop = max(black_percent, na.rm = T)) %>%
  filter(max_pop == max(max_pop, na.rm = T)) %>%
  pull(state)

# Percent voter turnout for MS
summary_info$voter_turnout_ms <- county_statistics_1_ %>%
  select(state, county, TotalPop, VotingAgeCitizen) %>%
  mutate(voter_percent = VotingAgeCitizen / TotalPop * 100) %>%
  group_by(state) %>%
  summarise(avg_voters = mean(voter_percent, na.rm = T)) %>%
  filter(state == "MS") %>%
  pull(round(avg_voters))

# state with the most white population
summary_info$max_race_pop_white <- county_statistics_1_ %>%
  mutate(white_percent = White / TotalPop * 100) %>%
  select(state, county, TotalPop, white_percent) %>%
  group_by(state) %>%
  summarise(max_pop = max(white_percent, na.rm = T)) %>%
  filter(max_pop == max(max_pop, na.rm = T)) %>%
  pull(state)



View(summary_info)
