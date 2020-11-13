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
filter(state == "US")

  
#attempt at US group by   
grouped_table <- us_table %>%
  group_by(state) %>%
  summarise(
    mean_voted = mean(total_voted)
  )
  
  
  
