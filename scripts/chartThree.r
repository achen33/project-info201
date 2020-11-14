# Script 
# Load necessary packages
install.packages("ggplot2")
library("ggplot2")
install.packages("dplyr")
library("dplyr")

race <- read.csv("~/Documents/UW/junior/INFO 201/project-info201/data:/national_race.csv")

race_total <- select(race, Sex..Race.and.Hispanic.Origin, Total.registered, Total.voted)
View(race_total)
race_bipoc <- race[-c(1, 5, 6, 7), ]
View(race_bipoc)

pie_reg <- ggplot(race_bipoc, aes(x="", y = Total.registered, fill = Sex..Race.and.Hispanic.Origin)) +
  geom_col(color = "black") +
  coord_polar("y", start=0) + 
  ggtitle( "Pie Chart of Total BIPOC Registered")
pie_reg 

pie_vote <- ggplot(race_bipoc, aes(x="", y = Total.voted, fill = Sex..Race.and.Hispanic.Origin)) +
  geom_col(color = "black") +
  coord_polar("y", start=0) + 
  ggtitle( "Pie Chart of Total BIPOC Voted")
pie_vote 



