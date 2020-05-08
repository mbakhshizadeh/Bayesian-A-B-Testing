# LOAD YOUR PACKAGES
library(shiny)
library(quantmod)
library(ggplot2)
library(forecast)
library(plotly)
library(ggfortify)
library(tseries)
library(gridExtra)
library(docstring)
library(readr)
library(dygraphs)
library(feedeR)# show news
library(shinyWidgets)
library(here)
library(dplyr)
library(DT) # create table professionally
library(vars)
library(shinydashboard)
library(tidyverse)
library(lubridate)
library(xtable)
library(rmgarch)
library(shinycssloaders)


shinyUI(fluidPage(
  column(8,offset = 4,titlePanel(title = "Bayesian A/B Testing: Click-Through Application")),
  

  
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Choose CSV File from directory that includes your website clich-through information. (Create CSV as below picture)",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      tags$hr(),
      helpText("Note: This is Bayesian A/B testing method.\n In this method, Beta distribution is fitted to the data.\nThe Beta distribution is resampled 1 million times based on original data information.
      As a result, by looking at the means of both distribuations, we can find which plan ends up more click-through."),
      helpText("Sections:"),
      helpText("My Example:Here is a defualt sample data that has been constructed as below picture. \n
               In the graph, we can see that Plan B is ended up more click-through since it has higher mean"),
      helpText("Your Work:Here you will see the result of your imported data. Please click on Your Work tab.Then upload your csv file. Please put the information of your website click-through for both plans as below picture. Use the same headers on the CSV file"),
      helpText("Result: Greater mean --> Best Plan."),
      helpText("Example Data: https://github.com/lazyprogrammer"),
      img(src='example.JPG',height="70%", width="70%",align = "bottom")
    ),
    mainPanel(
      tabsetPanel(
        
        tabPanel("My Example", plotOutput("My_Example"), class = 'rightAlign'),
        tabPanel("Your Work", plotOutput(c("Your_Work","table")), class = 'rightAlign')
        
      )
      
    )
  )
))


