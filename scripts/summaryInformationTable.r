library(readxl)
library(tidyr)
library(dplyr)
library(readr)
library(tidyverse)

data <- read.csv("https://raw.githubusercontent.com/achen33/project-info201/main/data/county_statistics%20(1).csv")

num_states <- length(unique(data$state))

vote_diff <- data %>% 
  group_by(state) %>% 
  summarise(votes20_Joe_Biden = sum(votes20_Joe_Biden, 
                                                   na.rm = TRUE))
  summarise(votes20_Donald_Trump = sum(votes20_Donald_Trump,
                                                    na.rm = TRUE))
  mutate(biden_votes = 
           if_else(votes20_Joe_Biden >= votes20_Donald_Trump,
                   leading_candidate_votes, 
                   trailing_candidate_votes 
           ), 
         trump_votes = total_votes_count - biden_votes
  )
  mutate(vote_diff = biden_votes - trump_votes, 
         pct_diff = vote_diff / total_votes20)

vote_diff_plot <- ggplot(data = vote_diff) + 
  geom_col(mapping = aes(x = vote_diff, 
                         y = reorder(state, vote_diff), 
                         fill = leading_candidate_name)) +
  scale_fill_manual(values=c("blue", "red")) +
  labs(y = "State", x = "Vote Difference", fill = "Candidate", 
       title = "Vote difference at most recent time stamp")

vote_pct_plot <- ggplot(vote_diff) + 
  geom_col(mapping = aes(x = pct_diff, y = reorder(state, pct_diff)))
