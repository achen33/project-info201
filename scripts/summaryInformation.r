# Assignment asked to include:
# A function that takes in a dataset and returns a list of info about it:
summary_info <- list()
summary_info$num_observations <- nrow(my_dataframe)
summary_info$some_max_value <- my_dataframe %>%
  filter(some_var == max(some_var, na.rm = T)) %>%
  select(some_label)

# Audrey's work (Min, max)

library("dplyr")
library("tidyverse")
library(readr)

county_statistics_1_ <- read_csv("data/county_statistics (1).csv")
View(county_statistics_1_)

#State with the most  % votes for Biden in the 2020 election 
summary_info$max_percent_joe <- county_statistics_1_ %>%
  select (state, percentage20_Joe_Biden) %>%
  group_by(state)%>%
  summarise(max_percent = mean(percentage20_Joe_Biden, na.rm=T)) %>%
  filter(max_percent == max(max_percent, na.rm=T)) %>%
  pull(state)
  View(max_percent_joe)


#State with the most % votes for Trump in the 2020 election 
summary_info$max_percent_trump <- county_statistics_1_ %>%
    select (state, percentage20_Donald_Trump) %>%
    group_by(state)%>%
    summarise(max_percent = mean(percentage20_Donald_Trump, na.rm=T)) %>%
    filter(max_percent == max(max_percent, na.rm=T)) %>%
    pull(state)
    View(max_percent_trump)

#state with the most black population 
summary_info$max_race_pop_black <- county_statistics_1_ %>%
  mutate(black_percent = Black / TotalPop *100) %>%
  select(state, county, TotalPop, Men, Women, Hispanic, White, Black, Native, Asian, Pacific, black_percent) %>%
  group_by(state) %>%
  summarise(max_pop = max(black_percent, na.rm = T))%>%
  filter(max_pop == max(max_pop, na.rm=T)) %>%
  pull(state)

  
#Percent voter turnout for MS 
summary_info$voter_turnout_ms <- county_statistics_1_ %>%
  select(state, county, TotalPop, VotingAgeCitizen) %>%
  mutate(voter_percent = VotingAgeCitizen / TotalPop *100) %>%
  group_by(state)%>%
  summarise(avg_voters = mean(voter_percent, na.rm = T)) %>%
  filter(state == "MS") %>%
  pull(round(avg_voters))
  
#state with the most white population 
summary_info$max_race_pop_white <- county_statistics_1_ %>%
  mutate(white_percent = White / TotalPop *100) %>%
  select(state, county, TotalPop, white_percent) %>%
  group_by(state) %>%
  summarise(max_pop = max(white_percent, na.rm = T))%>%
  filter(max_pop == max(max_pop, na.rm=T)) %>%
  pull(state)
  
  
summary_info <- list()
summary_info$max_percent_joe <- county_statistics_1_ %>%
summary_info$max_percent_trump <- county_statistics_1_ %>%
summary_info$max_race_pop_black <- county_statistics_1_ %>%
summary_info$voter_turnout_ms<- county_statistics_1_ %>%
summary_info$max_race_pop_white<- county_statistics_1_ %>%

  
  
  
  
  
  
  

# Selina's work (Ratio: (1) Female Voted to Total Pop Voted; 
# (2) BIPOC Voted to Total Pop Voted)
install.packages("dplyr")
library("dplyr")
install.packages("tidyverse")
library("tidyverse")

national <- read.csv("~/Documents/UW/junior/INFO 201/project-info201/data:/national.csv")
View(national)

# Ratio of Total Female Voted to Total Pop Voted 
national_groups <- select(national, Sex..Race.and.Hispanic.Origin, Total.voted)
View(national_groups)
female_data <- national_groups[-c(4:10), ]
View(female_data)
total_female_voted <- female_data %>%
  filter(total == max(Female))
total_pop_voted <- female_data %>%
  filter(total == max(Total))
ratio_female_to_total <- total_female_voted / total_pop_voted  

# Ratio of Total BIPOC Voted to Total Pop Voted 
national_groups <- select(national, Sex..Race.and.Hispanic.Origin, Total.voted)
View(national_groups)
bipoc_data <- national_groups[-c(1:3), ]
View(bipoc_data)
total_bipoc_voted <- bipoc_data %>%
  filter(bipoc_data, Total.voted == "Black alone", "Asian alone", "Hispanic 
         (of any race)"
         )
total_pop_voted <- bipoc_data %>%
  filter(total == max(Total))
ratio_bipoc_to_total <- total_bipoc_voted / total_pop_voted 
