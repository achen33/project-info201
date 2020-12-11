library(shiny)
library(tidyverse)
library(plotly)
library(rsconnect)
library(dplyr)

county_statistics_1_copy <- read_csv("county_statistics (1) copy.csv")


us_election <- county_statistics_1_copy %>%
  select(state, votes20_Donald_Trump, votes20_Joe_Biden, total_votes20, 
         TotalPop, county, White, Asian, Black, Hispanic, Pacific, Native)
filter(iso_code != "")


# First Tab which includes the introduction.
intro_panel <- tabPanel(
  "Introduction",
  titlePanel("title of project"),
  p("By: Audrey, Selina, Hadar"),
  h3("Introduction"),
  img(src = "https://i.guim.co.uk/img/media/ea344028ac2fe5a1c1db9d55adcfaf01951f7777/0_60_3500_2100/master/3500.jpg?width=445&quality=85&auto=format&fit=max&s=433342dd5a78238a336fc994602d1bda", height = "400", width = "600"),
  p("Throughout the years, disparities within voter turnout and trends 
  increasingly 
      become a topic for heated debated -- This is especially true nearing
      presidential elections. Such questions that arises are:
          
          - What affects the disparities within voter turnout and trends?
          - To what extent does gender (Specifically, male versus female), race
          or any other
      social classifications affect these statistics?
          - Which parties/candidates do certain gender and race gear towards? 
          (Waiting on Audrey for   third takeaway)
      
      With that said, we are interested in this because our group feels that 
      issues and 
      policies in politics are heavily swayed by gender and race. We also 
      recognized that marginalized communities are usually not as 
      representative in voting, so we centered our study around that. In short, 
      these issues are especially prevalent today as with the most recent 
      election, most ideas were very polarized and driven by prejudices.
      
      For this project, we have been using the data set of `county.csv` to 
      analyze our 
      question. This data set has an accumulation of voting data and displays 
      the voting information separated by location and the demographic of each
      location. Honing in on both the 2016 and 2020 presidential election, we 
      observed how
      voting trends have differed or stayed the same. From that, we looked at
      how 
      gender and race plays a role in the numbers. Specifically, we looked at
      what the 
      trends looked like for the white populace versus for marginalized
      communities, as 
      BIPOC are our target group of focus. ")
)


# widgets for education graph
# total votes
total_votes_sidebar <- sidebarPanel(
  p("Find population"),
  selectInput(
    inputId = "downlist",
    label = h3("Choose a state"),
    choices = us_election$state
  )
)

# education graph itself
# population
total_votes_content <- mainPanel(
  plotlyOutput("total_votes_graph")
)

# education tab
# population
total_votes_panel <- tabPanel(
  "Total Votes",

  titlePanel("total votes of each state"),

  sidebarLayout(
    total_votes_sidebar,
    total_votes_content
  )
)

# widgets for gender graph
# race
race_sidebar <- sidebarPanel(
  checkboxGroupInput("select",
    label = h3("Check Race"),
    choices = list(
      "White" = us_election$White, "Black" = us_election$Black,
      "Hispanic" = us_election$Hispanic,
      "Pacific" = us_election$Pacific, "Asian" = us_election$Asian
    ),
    selected = 1
  )
)

# education gender itself
# race
race_content <- mainPanel(
  plotOutput("race_graph")
)

# gender tab
# Race
race_panel <- tabPanel(
  "Race Graph",

  titlePanel("graph title here"),

  sidebarLayout(
    race_sidebar,
    race_content
  )
)

# widgets for race graph
# vote
vote_sidebar <- sidebarPanel(
  radioButtons("radio",
    label = h3("Choose a state"),
    choices = list(
      "AZ" = us_election$state, "CO" = us_election$state, "FL" = us_election$state, "GA" = us_election$state,
      "IA" = us_election$state, "MI" = us_election$state, "NC" = us_election$state, "PA" = us_election$state,
      "TX" = us_election$state, "WI" = us_election$state
    ),
    selected = 1
  )
)


# race gender itself
# vote
vote_content <- mainPanel(
  plotOutput("vote_graph")
)

# race tab
# vote
vote_panel <- tabPanel(
  "Votes Graph",

  titlePanel("graph title here"),

  sidebarLayout(
    vote_sidebar,
    vote_content
  )
)
# First Tab which includes the introduction.
summary_panel <- tabPanel(
  "Summary",
  titlePanel("Summary and Takeaways"),
  h3("Education Takeaway"),
  p("Our conclusion here blah blah blah")
)

# Create overall ui by calling the into panel and plot panel
ui <- fluidPage(
  navbarPage(
    "US Election",
    intro_panel,
    total_votes_panel,
    race_panel,
    vote_panel,
    summary_panel
  )
)
