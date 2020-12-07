library(shiny) 
library(tidyverse)
library(plotly)
library(rsconnect)
library(dplyr)

county_statistics_1_copy <- read_csv("county_statistics (1) copy.csv")


us_election <- county_statistics_1_copy %>%
  select(state, votes20_Donald_Trump, votes20_Joe_Biden, total_votes20, TotalPop, county, White, Asian, Black, Hispanic, Pacific) 
#filter(iso_code != "")


# First Tab which includes the introduction.
intro_panel <- tabPanel(
  "Introduction",
  titlePanel("title of project"),
  p("By: Audrey, Selina, Hadar"),
  h3("Introduction"),
  img(src = "https://i.guim.co.uk/img/media/ea344028ac2fe5a1c1db9d55adcfaf01951f7777/0_60_3500_2100/master/3500.jpg?width=445&quality=85&auto=format&fit=max&s=433342dd5a78238a336fc994602d1bda",height="400", width="1400"),
  p("introduction"),
  p(
    "This is our report of the Labor Force Statistics Dataset from the ",
    a(href = "https://data.bls.gov/cgi-bin/surveymost?ln", "U.S. Bureau of Labor Statistics"),
  )
)


# widgets for education graph
# population 
population_sidebar <- sidebarPanel(
  p("Find population"),
  selectInput( 
    inputId = "state",
    label = h3("Choose a state"),
    choices = us_election$state
  )
)

# education graph itself
# population
population_content <- mainPanel(
  plotlyOutput("chartOneNew.r")
)

# education tab
# population 
population_panel <- tabPanel(
  "State Population",
  
  titlePanel("Population of each state"),
  
  sidebarLayout(population_sidebar,
                population_content)
)

# widgets for gender graph
# race
race_sidebar <- sidebarPanel(
  checkboxGroupInput("select", label = h3("Check Race"), 
                     choices = list("White" = us_election$White, "Black" = us_election$Black, 
                                    "Hispanic" = us_election$Hispanic, "Native" = us_election$Native, 
                                    "Pacific" = us_election$Pacific, "Asian" = us_election$Asian),
                     selected = 1),
)

# education gender itself
# race 
race_content <- mainPanel(
  plotOutput("chartTwoNew.r")
)

# gender tab
# Race 
race_panel <- tabPanel(
  "Race Graph",
  
  titlePanel("graph title here"),
  
  sidebarLayout(race_sidebar,
                race_content)
)

# widgets for race graph
# vote
vote_sidebar <- sidebarPanel(
  radioButtons("radio", label = h3("Chose a year"),
               choices = list("2016 election" = us_election$total_votes20, "2020 election" = us_election$total_votes20), 
               selected = 1),
)


# race gender itself
# vote
vote_content <- mainPanel(
  plotOutput("chartThreeNew.r")
)

# race tab
# vote
vote_panel <- tabPanel(
  "Votes Graph",
  
  titlePanel("graph title here"),
  
  sidebarLayout(vote_sidebar,
                vote_content)
)
# First Tab which includes the introduction.
summary_panel <- tabPanel(
  "Summary",
  titlePanel("Summary and Takeaways"),
  h3("Education Takeaway"),
  p("Our conclusion here blah blah blah")
)

# Create overall ui by calling the into panel and plot panel
ui <- navbarPage(
  "US Election",
  intro_panel,
  population_panel,
  race_panel,
  vote_panel,
  summary_panel
)