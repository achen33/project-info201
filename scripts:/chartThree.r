# This chart was created with the intentions of visualizing the relationship
# between the number of BIPOC individuals who registered to vote versus the
# number of BIPOC individuals who voted within the U.S. 2016 Presidential 
# Election. Similar to the other two charts, while this chart highlights a
# different demographic, it will allow us to compare the statistics 
# of voter registration between different genders and race groups to observe any
# possible disparities. 

# Script (Pie Chart)
install.packages("ggplot2")
library("ggplot2")
install.packages("dplyr")
library("dplyr")

national_race <- read.csv("~/Documents/UW/junior/INFO 201/project-info201/data:/national_race.csv")

race_total <- select(race, Sex..Race.and.Hispanic.Origin, Total.registered, Total.voted)
View(race_total)
race_bipoc <- race[-c(1, 5, 6, 7), ]
View(race_bipoc)






