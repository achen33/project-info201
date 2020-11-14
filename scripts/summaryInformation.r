# Assignment asked to include:
# A function that takes in a dataset and returns a list of info about it:
summary_info <- list()
summary_info$num_observations <- nrow(my_dataframe)
summary_info$some_max_value <- my_dataframe %>%
  filter(some_var == max(some_var, na.rm = T)) %>%
  select(some_label)

# Audrey's work (Min, max)
install.packages("dplyr")
library("dplyr")
install.packages("tidyverse")
library("tidyverse")

national_race <- read.csv("~/Desktop/project-info201/data:/national_race.csv")

names(national_race)
race <- national_race$Sex...Race.and.Hispanic.Origin
registered <- national_race$Percent.registered..Total.
voted <- national_race$Percent.voted..Total.

min_percent_registered <- race %>%
  filter(registered == min(registered)) %>% 
  pull(race)
max_percent_registered <- race %>%
  filter(registered == max(registered)) %>%
  pull(race)
min_percent_voted <- race %>%
  filter(voted == min(voted)) %>%
  pull(race)
max_percent_voted <- race %>%
  filter(voted == max(voted)) %>%
  pull(race)

# Selina's work (Ratio: (1) Female Voted to Total Pop Voted; 
# (2) BIPOC Voted to Total Pop Voted)
install.packages("dplyr")
library("dplyr")
install.packages("tidyverse")
library("tidyverse")

national <- read.csv("~/Documents/UW/junior/INFO 201/project-info201/data:/national.csv")
View(national)

# Ratio of Female Voted to Total Pop Voted 
national_groups <- select(national, Sex..Race.and.Hispanic.Origin, Total.registered, Total.voted)
View(national_groups)
female_data <- national_groups[-c(4:10), ]
View(female_data)


# Ratio of BIPOC Voted to Total Pop Voted 
national_groups <- select(national, Sex..Race.and.Hispanic.Origin, Total.registered, Total.voted)
View(national_groups)
bipoc_data <- nattional_groups[-c(1:3), ]
View(bipoc_data)
  
