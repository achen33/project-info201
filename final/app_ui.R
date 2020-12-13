library(shiny) 
library(tidyverse)
library(plotly)
library(rsconnect)
library(dplyr)
library(readr)
library(ggplot2)

votes_data <- read_csv("county_statistics (1) copy.csv")



us_election <- county_statistics_1_copy %>%
  select(state, votes20_Donald_Trump, votes20_Joe_Biden, total_votes20, TotalPop, county, White, Asian, Black, Hispanic, Pacific, Native) 
#filter(iso_code != "")

state_votes <- us_election %>%
  group_by(state) %>%
  summarize(
    voted_trump = sum(votes20_Donald_Trump, na.rm = TRUE),
    voted_biden = sum(votes20_Joe_Biden, na.rm = TRUE)
  ) 

  

# First Tab which includes the introduction.
intro_panel <- tabPanel(
  "Introduction",
  titlePanel("Voting Trends in the United States"),
  p("By: Audrey, Selina, Hadar"),
  h3("Introduction"),
  img(src = "https://i.guim.co.uk/img/media/ea344028ac2fe5a1c1db9d55adcfaf01951f7777/0_60_3500_2100/master/3500.jpg?width=445&quality=85&auto=format&fit=max&s=433342dd5a78238a336fc994602d1bda",height="400", width="600"),
  p("Throughout the years, disparities within voter turnout and trends increasingly 
      become a topic for heated debated -- This is especially true nearing presidential elections. Such questions that arises are:
          
          - What affects the disparities within voter turnout and trends?
          - To what extent does gender (Specifically, male versus female), race or any other
      social classifications affect these statistics?
          - Which parties/candidates do certain gender and race gear towards? (Waiting on Audrey for   third takeaway)
      
      With that said, we are interested in this because our group feels that issues and 
      policies in politics are heavily swayed by gender and race. We also recognized that marginalized communities are usually not as representativce in voting, so we centered our study around that. In short, these issues are especially prevalent today as with the most recent election, most ideas were very polarized and driven by prejudices.
      
      For this project, we have been using the data set of `county.csv` to analyze our 
      question. This data set has an accumulation of voting data and displays the voting information separated by location and the demographic of each location. Honing in on both the 2016 and 2020 presidential election, we observed how
      voting trends have differed or stayed the same. From that, we looked at how 
      gender and race plays a role in the numbers. Specifically, we looked at what the 
      trends looked like for the white populace versus for marginalized communitiies, as 
      BIPOC are our target group of focus. ")
)

list_states <- new_election_df$state


# total votes
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
  titlePanel("total votes of each state"),
  sidebarLayout(total_votes_sidebar,
                total_votes_content)
)


# race
race_sidebar <- sidebarPanel(
  checkboxGroupInput("races", label = h3("Check Race"), 
                     choices = list("White" = us_election$White, "Black" = us_election$Black, 
                                    "Hispanic" = us_election$Hispanic,
                                    "Pacific" = us_election$Pacific, "Asian" = us_election$Asian)
  )
)


# race 
race_content <- mainPanel(
  plotlyOutput("race_graph")
)


# Race 
race_panel <- tabPanel(
  "Race Graph",
  
  titlePanel("graph title here"),
  
  sidebarLayout(race_sidebar,
                race_content)
)

#votes
votes_sidebar <- sidebarPanel(
  p("Find Voting Trends"),
  selectInput( 
    inputId = "sel_states",
    label = "Choose a state",
    choices = list_states, 
    selected = "WA")
)

votes_content <- mainPanel(
  plotlyOutput("votes_plot")
)


vote_panel <- tabPanel(
  "Votes Graph",
  titlePanel("Voting Trends in Each Swing State"),
  sidebarLayout(votes_sidebar,
                votes_content)
)



# First Tab which includes the introduction.
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

