# -------------------- OWN THE LIBS -------------------------------------

library(shiny)
library(shinydashboard)
library(tidyverse)
library(fontawesome) #for theming
library(fresh)       #for theming
library(ggside)      #for side density plots
library(gt)          #for GT tables
library(gtsummary)   #for GT tables
library(kableExtra)  #for kable tables
library(corrplot)    #for correlation matrix plot
library(ggdist)      #for halfeye plots

#--------------------- Theme ----------------------------------

mytheme <- create_theme(
  adminlte_color(
    light_blue = "#253f8c", 
    yellow = "#8fb9ca" ),
  
  adminlte_sidebar(
    width = "250px",
    dark_bg = "#FFFFFF",
    dark_hover_bg = "#FFFFFF",
    dark_color = "#FF0000"
  ),
  
  adminlte_global(
    content_bg = "#FFFFFF",
    box_bg = "#FFFFFF", 
    info_box_bg = "#8fb9ca"
    
  )
)

#####--------------------- Call Data Files ----------------------------------

# Survey 1

getwd()

data1 <- readRDS("../dashdata_s1.rds")

data2 <- readRDS("../dashdata_s2.rds")
#--------------------- LOAD FUNCTIONS ----------------------------------

source("funs_s1.R")
