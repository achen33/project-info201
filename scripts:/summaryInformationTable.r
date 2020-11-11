library(readxl)
library(tidyr)
install.packages("installr")


total_pop <- voting_table %>%
  select(X2, X3, X10) %>%
  slice(5:11) 
  select(precent_total_voted = ceiling(total_pop$precent_total_voted))
  names(total_pop)[1] <- "sex_race"
  names(total_pop)[2] <- "total_population"
  names(total_pop)[3] <- "total_voted"
  
