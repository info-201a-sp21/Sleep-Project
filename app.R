library("shiny")
library("ggplot2")
library("plotly")

source("myserver.R")
source("myui.R")

shinyApp(ui = ui, server = server)