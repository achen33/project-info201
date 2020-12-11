library(tidyverse)
library(dplyr)
library(plotly)
library(shiny)
library(ggplot2)


server <- function(input, output) {
  output$total_votes_graph <- renderPlot({
    bar_2020_data <- us_election %>%
      select(state, total_votes20) %>%
      group_by(state) %>%
      summarize(state_total = sum(total_votes20, na.rm = TRUE)) %>%
      mutate(state_total)

    output$value <- renderPrint({
      input$downlist
    })

    ggplot(data = bar_2020_data) +
      geom_col(mapping = aes(x = input$downlist, y = state_total)) +
      ggtitle("Total Votes by State in 2020 President Election")
  })

  output$race_graph <- renderPlot({
    race_prop_data <- us_election %>%
      select(state, input$radio) %>%
      gather(key = race, value = population, -state)

    output$value <- renderPrint({
      input$radio
    })

    ggplot(race_prop_data) +
      geom_col(mapping = aes(
        x = state,
        y = population,
        fill = race
      )) +
      ggtitle("Racial Proportions of State Populations")
  })

  output$vote_graph <- renderPlot({
    votes_2020_data <- us_election %>%
      group_by(state) %>%
      filter(state == "AZ" | state == "CO" | state == "FL" | state == "GA"
      | state == "IA" | state == "MI" | state == "NC" | state == "PA"
      | state == "TX" | state == "WI") %>%
      summarize(
        voted_trump = sum(votes20_Donald_Trump, na.rm = TRUE),
        voted_biden = sum(votes20_Joe_Biden, na.rm = TRUE)
      )

    output$value <- renderPrint({
      input$select
    })

    ggplot(data = votes_2020_data) +
      geom_point(mapping = aes(
        x = voted_trump,
        y = voted_biden,
        color = state
      )) +
      ggtitle("Comparison of State Votes for Trump vs. Biden")
  })
}
