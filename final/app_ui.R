# Load needed packages 
library(shiny) 
library(tidyverse)
library(plotly)
library(rsconnect)
library(dplyr)
library(readr)
library(ggplot2)

# Load data set 
county_statistics <- read.csv("https://raw.githubusercontent.com/achen33/project-info201/main/final/county_statistics%20(1)%20copy.csv")

# Filter data set to extract needed information 
us_election <- county_statistics %>%
  select(state, votes20_Donald_Trump, votes20_Joe_Biden, total_votes20, TotalPop, county, White, Asian, Black, Hispanic, Pacific, Native) 
#filter(iso_code != "")

state_votes <- us_election %>%
  group_by(state) %>%
  summarize(
    voted_trump = sum(votes20_Donald_Trump, na.rm = TRUE),
    voted_biden = sum(votes20_Joe_Biden, na.rm = TRUE)
  ) 

race_pop_df <- county_statistics %>%
  select(state, Hispanic, White, Black, Native, Asian, Pacific) %>% 
  gather(key = race, value = population, -state) 
  
states_for_list <- state_votes %>%
  select(state) %>%
  filter (state == "AZ" | state == "CO" | state == "FL" | state == "GA"
          | state == "IA" | state == "MI" | state == "NC" | state == "PA"
          | state == "TX" | state == "WI")

swing_states_list <- states_for_list$state

## Introduction Tab 
intro_panel <- tabPanel(
  "Introduction",
  titlePanel("Voting Trends in the United States"),
  p("By: Audrey Chen, Selina Dinh, Hadar Dolev"),
  h3("Introduction"),
  img(src = "https://i.guim.co.uk/img/media/ea344028ac2fe5a1c1db9d55adcfaf01951f7777/0_60_3500_2100/master/3500.jpg?width=445&quality=85&auto=format&fit=max&s=433342dd5a78238a336fc994602d1bda",height="400", width="600"),
  p(
  "Throughout the years, disparities within voter turnout and trends increasingly 
      become a topic for heated debated -- This is especially true nearing 
      presidential elections. Such questions that arises are:"),
  p(
    " 1) What affects the disparities within voter turnout and trends?
      2) To what extent does raceaffect these statistics?
      3) How impactful are swing states in dictating the election's victory?"
  ),
  p(
    "With that said, we are interested in this because our group feels that 
      issues and policies in politics are heavily swayed by various factors, especially
      the demographics and social classfications. We also recognized that 
      marginalized communities are usually not as representative in voting, 
      so we centered our study around that to measuere their levels of involvement
      was for this election. In short, when it comes to voting and elections with 
      such high magnitude, it is impertinent that we observce with a scope of 
      different perspectives." 
    ),
  p(
  "For this project, we have been using the data set of `county.csv` to 
      analyze our question. This data set has an accumulation of voting data and
      displays the voting information separated by location and the demographic of 
      each location. Honing in on both the 2016 and 2020 presidential election, 
      we observed how voting trends have differed or stayed the same. From that,
      we looked at how race plays a role in the numbers. 
      Specifically, we looked at what the trends looked like for the white 
      populace versus for marginalized communitiies, as BIPOC are our target
      group of focus."
    )
)

list_states <- new_election_df$state

## Charts Tabs 
# Chart 1: Total Votes 
total_votes_sidebar <- sidebarPanel(
  p("Find total votes"),
  selectInput( 
    inputId = "sel_states",
    label = "Choose a state",
    choices = list_states, 
    selected = "WA")
)

total_votes_content <- mainPanel(
  plotlyOutput("trump_biden_plot")
)

total_votes_panel <- tabPanel(
  "Total Votes",
  titlePanel("Total votes of each state"),
  h3("This chart displays the total votes for each candidate
    in each of the swing states. We wanted to used this chart to display the 
    different number of votes in each of 
     swing states to see the comparison between those who voted for Biden
     and those who voted for Trump in the election. From the chart, we can see
     that in each of these states the number of votes for each candidate are
     much closer to each other in these states than non-swing states which 
     indicates the importance of the outcomes in these states."),
  sidebarLayout(total_votes_sidebar,
                total_votes_content)
)

# Chart 2: Race
race_sidebar <- sidebarPanel(
  radioButtons(
    inputId = "radio", 
    label = "select state", 
    choices = swing_states_list,
    selected = "AZ")
)

race_content <- mainPanel(
  plotlyOutput("race_graph")
)

race_panel <- tabPanel(
  "Race Graph",
  titlePanel("Race Voting Trends"),
  h3("This chart displays the votes for each candidate from each race group. 
   We wanted to used this chart to display the differences in voting trends 
   between each race group in order to see the comparison between those who 
   voted for Biden and those who voted for Trump in the election and look for 
   any correlations between race and political opinion. From the chart, we can 
   see that the majority of people of color are much more inclined to vote for 
     Biden which shows that race plays a role in the voting trends and may
     account for the state voting difference as well."),
  sidebarLayout(race_sidebar,
                race_content)
)

# Chart 3: Votes 
votes_sidebar <- sidebarPanel(
  p("Find Voting Trends"),
  checkboxGroupInput(
    inputId = "select_state", 
    label = "select states:", 
    choices = swing_states_list,
    selected = swing_states_list )
)

votes_content <- mainPanel(
  plotlyOutput("votes_plot")
)

vote_panel <- tabPanel(
  "Votes Graph",
  titlePanel("Voting Trends in Each Swing State"),
  h3("This chart displays the relationship between the votes for each candidate
    in each of the swing states. We wanted to used this chart to display the 
   the proportions of those who voted for Biden qnd those who voted for Trump 
   in the 2020 election within these selected swing states, individually, and 
   also comparatively with the other states as well. From the chart, in many of
     these states the ratio between the two candidates is similar given that 
     they are swing states, but there were ultimately more states that 
     had a higher Biden ratio than that of Trump, leading to the victory."),
  sidebarLayout(votes_sidebar,
                votes_content)
)

## Summary Tab 
summary_panel <- tabPanel(
  "Summary",
  titlePanel("Summary and Takeaways"),
  h3("Education Takeaway"),
  p("Our three main takeaways from this research project were surrounding the 
  focus of race and its effects on voting. 
    Firstly, when analysing our tables 
  and visuals displaying the voting disparities within the states and then
  comparing these data with the racial breakdowns in each state, we can see that
  there is a significant divide in political voting outcomes depending on the 
  race identities of the citizens. We found that a majority of citizens from a
  marginalized community of color typically tended to vote against Trump in the
  elections. 
    Secondly, we noticed that there was a consistent trend in the 
  Southern states there was a higher percentage of votes for Donald Trump than
  those for Joe Biden. Similarly, there was typically a trend for Joe Biden in
  the west coast states and in the northeast. We correlated these trends to the 
  racial breakdowns in theses regions in the United States where individuals of 
  color typically were the same regions that voted for against Donald Trump.
    Lastly, with our charts and widgets analyzing the voting trends in the swing 
  states of the United States, we found that in the states were closer in the
  number of votes, but that ultimately had more Joe Biden votes than Donald 
  Trump votes, the race populations in these states were less significantly 
  dispersed, leading to a correlated less dispersed voting trends. 
    "),
  img(src = "https://i2.wp.com/www.brookings.edu/wp-content/uploads/2019/11/20191107_Metro_Election-results_Map-.png?w=768&crop=0%2C0px%2C100%2C9999px&ssl=1",height="400", width="600")
)

# Create overall UI
ui <- fluidPage(
  includeCSS("style.css")
  navbarPage(
    "US Election",
    intro_panel,
    total_votes_panel,
    race_panel,
    vote_panel,
    summary_panel
  )
)

