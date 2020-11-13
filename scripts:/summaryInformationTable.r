library(readxl)
library(tidyr)
library(dplyr)
install.packages("installr")

#state table 
total_in_state <- table04b %>%
  select(X1, X2, X3, X5, X10) %>%
  rename(
    state = X1,
    sex_race = X2,
    total_population = X3,
    total_registered = X5,
    total_voted = X10
  ) %>%
  slice(17: 577) 

#US total table   
us_table <- table04b %>%
  select(X1, X2, X3, X5, X10) %>%
  rename(
    state = X1,
    sex_race = X2,
    total_population = X3,
    total_registered = X5,
    total_voted = X10
  ) %>%
filter(!(sex_race == "Total")) %>%
filter(state == "US")

#this works without the gather function 
race_table <- us_table %>%
  select(sex_race, total_voted, total_population) %>%
  mutate(precent_voted = (total_voted/total_population *100)) %>%
  slice(3:10) %>%
  gather(race, precent_voted, 1:2)

#works without the gather part 
state_table <- total_in_state %>%
  select(state, sex_race, total_voted, total_population) %>%
  mutate(precent_voted = (total_voted/total_population *100)) %>%
  select(state, precent_voted) %>%
  gather(state, precent_voted, 1:2)
                     
                  
  
#attempt at US group by   
grouped_table <- us_table %>%
  group_by(sex_race) %>%
  summarise(
    mean_voted = mean(total_voted)
  )

grouped_table <- group_by(us_table, total_voted)
filter()

  summarise(us_table, mean_total_registered = mean(total_registered, na.rm = TRUE))
  summarise(grouped_table, mean_total_voted = mean(total_voted, na.rm = TRUE))



  
  
