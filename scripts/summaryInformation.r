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

state_votes <- county_statistics_1_ %>%
  select (state, percentage20_Joe_Biden, percentage20_Donald_Trump) %>%
  group_by(state)%>%
  summarise(percentage20_Joe_Biden == mean(percentage20_Joe_Biden, na.rm=T)) %>%
  filter(percentage20_Joe_Biden == min(percentage20_Joe_Biden, na.rm=T)) %>%
  View(state_votes)

#State with the most votes for Biden in the 2020 election 
state_max_voters_biden20 <- county_statistics_1_ %>%
  select(state, percentage20_Joe_Biden) %>%
  group_by(state) %>%
  summarise(percentage20_Joe_Biden == max(percentage20_Joe_Biden, na.rm=T)) %>%
  pull(state)

#State with the most votes for Trump in the 2020 election 
#-------------------FIX? -----------------------
state_max_voters_trump20 <- county_statistics_1_ %>%
  select(state, percentage20_Donald_Trump) %>%
  filter(percentage20_Donald_Trump == max(percentage20_Donald_Trump, na.rm=T)) %>%
  pull(state)

#state with the most black population 
#State with the most black population 
race_pop_black <- county_statistics_1_ %>%
  Select(state, county, TotalPop, Men, Women, Hispanic, White, Black, Native, Asian, Pacific) %>%
  mutate(black_percent = Black / TotalPop *100)
  group_by(state) %>%
  summarise(max_black_pop = max(black_percent, na.rm = T))
  summarise(min_black_pop = min(black_precent, na.rm=T))
  
#state with the most Hispanic population 
race_pop_hispanic <- county_statistics_1_ %>%
  select(state, county, TotalPop, Men, Women, Hispanic, White, Black, Native, Asian, Pacific) %>%
  mutate(hispanic_percent = Hispanic / TotalPop *100)
  group_by(state) %>%
  summarise(max_hispanic_pop = max(hispanic_percent, na.rm = T))
  

  

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
