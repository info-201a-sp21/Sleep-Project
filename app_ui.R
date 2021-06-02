library(plotly)
library(shiny)

# Page 1 - Intro Page - writing introduction for our project
intro_page <- tabPanel(
  
)

# Page 2 - 
page_2_side <- sidebarPanel(
  selectInput(
    "scattervar",
    label = "Select Plot Variable",
    choices = list(
      "Weekend Days & Holidays" = "w_and_h",
      "Nonholiday Weekends" = "n_w",
      "All days" = "all_days"
    )
  )
)

# Page 2 - 
page_2_main <- mainPanel(
  renderPlotly("scatter")
)

# Page 2 - 
page_2 <- tabPanel(
  "Types of Days vs. Avg Hours Slept",
  titlePanel("Types of Days vs. Average Hours Slept per Day"),
  sidebarLayout(
    page_2,
    page_2_main
  )
)


# Page 3 - side - some description about the chart & 
#               - provide list to select (Sleep Trend vs. Age Group)
page_3_side <- sidebarPanel(
  p(
  "The interactive graph to the right depict the trend of average sleep
    hours in each age group and overall is set to default for comparing
    those trends between age groups. Hover to see the exact average sleep
    hours in each year"),
  p(
    "You can seee the sleep hours trend for a specific age group by selecting
    an age group category below."
  ),
  selectInput(
    inputId = "age_cate",
    label = "Select Age Category",
    choices = list(
      "overall" = "overall",
      "15 years and over" = "15 years and over",
      "15 ~ 24 years" = "15 to 24 years",
      "25 ~ 34 years" = "25 to 34 years",
      "35 ~ 44 years" = "35 to 44 years",
      "45 ~ 54 years" = "45 to 54 years",
      "55 ~ 64 years" = "55 to 64 years",
      "65+ years" = "65 years and over"
    ),
    selected = "overall"
  )
)


# Page 3 - main - showing chart in mainpanel (Sleep Trend vs. Age Group)
page_3_main <- mainPanel(
  plotlyOutput("show_trend")
)


# Page 3 - combine the side and main panels
page_3 <- tabPanel(
  "Average Sleep Hour Trends per Age Group",
  h2("Trend of Average Sleep Hours In Each Age Group"),
  sidebarLayout(
    page_3_side,
    page_3_main
  )
)


# Conclusion Page - 
conclusion_page <- tabPanel(
  
)


# Create ui with all the pages we need
ui <- navbarPage(
  "Investigating Sleep Habits",
  page_2,
  page_3
)
