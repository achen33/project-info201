library(tidyverse)
library(dplyr)
library(plotly)
library(shiny)
library(ggplot2)
library(readxl)

new_election_df <- read_excel("new_election_df.xlsx",
  col_types = c("text", "text", "numeric")
)
county_statistics <- read.csv("https://raw.githubusercontent.com/achen33/project-info201/main/final/county_statistics%20(1)%20copy.csv")

############################### Chart 1########################################
# server1 <- chart 1
# sel_states
create_elec_plot <- function(df, sel_states) {
  election_color <- c("blue", "red")

  df <- df %>%
    filter(state == sel_states)

  trump_biden_plot <- ggplot(data = df, aes(
    x = candidate, y = votes,
    color = candidate,
    fill = candidate
  )) +
    geom_bar(stat = "identity") +
    scale_color_manual(values = election_color) +
    scale_fill_manual(values = election_color) +
    ggtitle("Total State Votes per Candidate")

  print(trump_biden_plot + labs(y = "Number of Votes", x = "Candidate"))
}
############################### Chart 2########################################

create_race_plot <- function(race_pop_df, radio) {
  df2 <- race_pop_df %>%
    filter(state == radio) %>%
    group_by(race) %>%
    summarize(
      total_p_race = sum(population, na.rm = TRUE)
    )


  race_prop_plot <- ggplot(data = df2) +
    geom_col(mapping = aes(
      x = race,
      y = total_p_race,
      fill = race
    )) +
    ggtitle("Racial Proportions of State Populations")

  print(race_prop_plot + labs(y = "Proportion", x = "Race"))
}
############################### Chart 3########################################
# server1 <- chart 3

# Chart Script
# select_states
create_vote_plot <- function(county_statistics, select_state) {
  df3 <- county_statistics %>%
    filter(state == select_state) %>%
    group_by(state) %>%
    summarize(
      voted_trump = sum(votes20_Donald_Trump, na.rm = TRUE),
      voted_biden = sum(votes20_Joe_Biden, na.rm = TRUE)
    )

  votes_plot <- ggplot(data = df3, aes(
    x = voted_trump,
    y = voted_biden
  )) +
    geom_point(mapping = aes(
      x = voted_trump,
      y = voted_biden,
      color = state
    )) +
    ggtitle("Total State Votes per Candidate")

  print(votes_plot + labs(y = "Voted for Biden", x = "Voted for Trump"))
}

############################### Server 2#######################################

server <- function(input, output) {
  output$trump_biden_plot <- renderPlotly({
    return(create_elec_plot(new_election_df, input$sel_states))
  })

  output$race_prop_plot <- renderPlotly({
    return(create_race_plot(race_pop_df, input$radio))
  })

  output$votes_plot <- renderPlotly({
    return(create_vote_plot(county_statistics, input$select_state))
  })
}



##############################################################################

# Version Control
lint("app_server.R")
style_file("app_server.R")
