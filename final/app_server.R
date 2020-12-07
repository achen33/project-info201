library(tidyverse)
library(dplyr)
library(plotly)
library(shiny)
library(ggplot2)

source("scripts/chartOneNew.r")
source("scripts/chartTwoNew.r")
source("scripts/chartThreeNew.r")
source("scripts/table_summary.R")


##### creates the server to create and output the graph from widget inputs.
server <- function(input, output) {
  output$value <- renderPrint({ input$state })
  output$value <- renderPrint({ input$radio })
  output$value <- renderPrint({ input$select })
}