install.packages("ggplot2")
library("ggplot2")
install.packages("dplyr")
library("dplyr")
library(tidyverse)

library(readr)
table <- read_csv("data:/us_table.csv")
View(table)


sex_only <- us_table %>%
  slice(1:2)
View(sex_only)

sex_race_voting <- sex_only %>%
  select(sex_race, total_voted) %>%
  gather(key = total_voted, value = sex_race)

ggplot(sex_race_voting) +
  geom_col(mapping = aes(x = sex_race, y = total_voted))
