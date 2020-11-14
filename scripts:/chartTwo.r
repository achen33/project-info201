#This chart was intended to show the relationship between the number of white
#individuals who registered and the number of white individuals who voted. The
#data from this graph then allows us to compare the differences between races
#in order to asses whether or not there is a significant disparity between 
#access to voting even after being registered between race groups.

library(ggplot2)

white <- read.csv("~/Desktop/project-info201/data/national_race.csv")

p <- ggplot(data = df, aes(x=x, y=y)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()
