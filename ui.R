# PACKAGES
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
library(shinycssloaders )# Loading message
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
  options(spinner.color="#0275D8", spinner.color.background="#ffffff", spinner.size=2),
  

  
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Choose CSV File from directory that includes your website clich-through information. (Create CSV as below picture)",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      tags$hr(),
      helpText("Note: This dashboard is based on Bayesian A/B testing method to find out which marketing plan is better than another.\n In this method, Beta distribution is fitted to the data.\n The Beta distribution is resampled 1 million times based on original data features.
      In the output, there are two distribution graphs that by looking at the means of both, we can find which plan ends up more click-through or conversion rate"),
      helpText("There two tabs in right-hand- side:"),
      helpText("My Example tab: This is a default sample data that has been constructed as below picture. \n
               In the graph, we can see that Plan B resulted better. i.e.  more click-through since it has higher mean"),
      helpText("Your Work tab: Here you will see the output of your imported data. Please click on Your Work tab. Then upload your csv file. Please put the information for both plans as below picture. Use the [same header names] on the CSV file"),
      helpText("as a result: Greater mean --> Best Plan."),
      
      helpText("Example Data: https://github.com/lazyprogrammer"),
      img(src='example.JPG',height="70%", width="70%",align = "bottom")
    ),
    mainPanel(
      tabsetPanel(
        
        tabPanel("My Example", column(width=12, withSpinner( plotOutput("My_Example"), type = 2)),class = 'rightAlign'),
        tabPanel("Your Work", column(width=12, withSpinner( plotOutput("Your_Work"), type = 2)),class = 'rightAlign')
 
        
      )
      
    )
  )
))


