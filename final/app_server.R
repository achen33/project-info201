library(tidyverse)
library(dplyr)
library(plotly)
library(shiny)
library(ggplot2)

library(readxl)

new_election_df <- read_excel("new_election_df.xlsx",
                              col_types = c("text", "text", "numeric"))
  # server1 ---------
  create_elec_plot <- function(df, sel_states) {
    election_color <- c("blue", "red")
    
    df <- df %>%
      filter(state == sel_states) 
    
    trump_biden_plot <- ggplot(data = df, aes(x = candidate, y = votes, color = candidate, fill = candidate)) +
      geom_bar(stat='identity') + 
      scale_color_manual(values = election_color) +
      scale_fill_manual(values = election_color)
  }

##Vote df
# Load data
county_statistics <- read.csv("https://raw.githubusercontent.com/achen33/project-info201/main/final/county_statistics%20(1)%20copy.csv")

# Chart Script

create_vote_plot <- function(county_statistics, sel_states) {
  
  df <- county_statistics %>%
    filter(state == sel_states) 

votes_plot <- ggplot(data = county_statistics, aes(x = candidate,
                                                   y = votes, color = candidate,
                                                   fill = candidate)) +
  geom_point(mapping = aes(
    x = voted_trump,
    y = voted_biden,
    color = state
  )) 
}
  # server2 output plot ---------

server <- function(input, output) {
  
  # new_election_df$candidate <- factor(
  #   new_election_df$candidate, 
  #   levels = c("Trump", "Biden")
  #   )
  

  output$trump_biden_plot <- renderPlotly({
    return(create_elec_plot(new_election_df, input$sel_states))
  
  })


####################################  
  output$race_graph <- renderPlot({ 
    race_prop_data <- county_statistics_1_copy %>%
      select(state, Hispanic, White, Black, Native, Asian, Pacific) %>%
      gather(key = race, value = population, -state)
    
    output$value <- renderPrint({input$races}) 
    
    ggplot(data = race_prop_data) +
      geom_col(mapping = aes(
        x = state,
        y = population,
        fill = race
      )) +
      ggtitle("Racial Proportions of State Populations")
  })
  
  output$vote_graph <- renderPlot({ 
    votes_2020_data <- county_statistics_1_copy %>%
      select(state == input$states) %>%
      group_by(state) %>%
      summarize(
        voted_trump = sum(votes20_Donald_Trump, na.rm = TRUE),
        voted_biden = sum(votes20_Joe_Biden, na.rm = TRUE)
      ) 
    
    
    output$value <- renderPrint({input$states})   
    
    ggplot(data = votes_2020_data) +
      geom_point(mapping = aes(
        x = voted_trump,
        y = voted_biden,
        color = state
      )) +
      ggtitle("Comparison of State Votes for Trump vs. Biden")
    
  })
}

