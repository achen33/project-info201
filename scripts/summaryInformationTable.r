library(readxl)
library(tidyr)
library(dplyr)


library(readr)
table04b <- read.csv("data/table04b.csv", 
                     col_names = FALSE)
View(table04b)

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

write.csv(us_table, file = "data/us_table.csv")

  
  
