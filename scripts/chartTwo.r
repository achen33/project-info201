#chart1

library(ggplot2)

white <- read.csv("~/Desktop/project-info201/data/national_race.csv")

p <- ggplot(data = df, aes(x=x, y=y)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()
