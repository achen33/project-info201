library(tidyverse)
library(dplyr)
library(plotly)
library(shiny)
library(ggplot2)


server <- function(input, output) {
  output$total_votes_graph <- renderPlot({ 
    bar_2020_data <- us_election %>%
      select(state, total_votes20, votes20_Joe_Biden, votes20_Donald_Trump) %>%
      group_by(state) %>%
      summarize(biden_votes = sum(votes20_Joe_Biden, na.rm = TRUE), trump_votes = sum(votes20_Donald_Trump, na.rm = TRUE)) %>%
      mutate(biden_votes, trump_votes) %>%
      #filter(state == "WA")
      filter(state == input$downlist)
    
    turned_table <-  t(bar_2020_data)
    colnames(turned_table) <- c("canidate")

    output$value <- renderPrint({input$downlist}) 
    
    ggplot(data = turned_table) +
      geom_col(mapping = aes(x = state , y = canidate)) +
      ggtitle("Total Votes by State in 2020 President Election")
  })
  
  output$race_graph <- renderPlot({ 
    race_prop_data <- county_statistics_1_copy %>%
      select(state, Hispanic, White, Black, Native, Asian, Pacific) %>%
      gather(key = race, value = population, -state)
    
    output$value <- renderPrint({input$select}) 
    
    ggplot(data = race_prop_data) +
      geom_col(mapping = aes(
        x = state,
        y = population,
        fill = race
      )) +
      ggtitle("Racial Proportions of State Populations")
  })
  
  output$vote_graph <- renderPlot({ 
    votes_2020_data <- us_election %>%
      filter(state == input$radio) %>%
      group_by(state) %>%
      summarize(
        voted_trump = sum(votes20_Donald_Trump, na.rm = TRUE),
        voted_biden = sum(votes20_Joe_Biden, na.rm = TRUE)
      ) 
    
    
    output$value <- renderPrint({input$radio})   
    
    ggplot(data = votes_2020_data) +
      geom_point(mapping = aes(
        x = voted_trump,
        y = voted_biden
      )) +
      ggtitle("Comparison of State Votes for Trump vs. Biden")
    
  })
}

