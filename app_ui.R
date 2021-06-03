library(plotly)
library(shiny)

# Page 1 - Intro Page - writing introduction for our project
intro_page <- tabPanel(
  inputId = "intro",
  fluidPage(
    h1("About Our Project"),
    p(
     " The balance between sleep and school or work can becomes extremely disrupted. 
      Sleep is highly needed but often sacrificed in order to 
      meet deadlines and complete work. Our project seeks to understand if this balance
      between sleep and school or work is highly imbalanced or if people are generally able
      to achieve a healthy amount of sleep. Therefore, our project is interested 
      in exploring this relationship between Americans and the amount of sleep they get 
      in order to derive findings regarding Americans and the amount they are spent working, 
      sleeping, and their health as sleep impacts that tremendously."
    ),
    h1("Our Data Source"),
    p(
      "In order to answer these questions about the relationship between Americans
      and sleep, we used data collected from 2003 to 2017 by American Time Use Survey
      from the Bureau of Labor Statistics. The survey gathered data from a 
      random sample of Americans of both sexes, ranging from ages 15 to 60 years and
      over. Namely, the dataset provides information about the type of day respondents reported
      sleeping, the average hours per day spent sleeping, the sex of the respondent,
      their age range, the year the data was collected.
    "),
    h1("Our Major Questions for Our Data"),
    p(
      "- What are the differences in hours slept between days in general, 
      weekends and holidays, and nonholiday weekends?
        We derived this information from the columns in the dataset that 
      pertained to types of days and average hours slept per day to answer this question.
      - What are the average number of hours slept by each age group over the 
      period of 2003-2017?
        We used the average number of hours slept per day and the age groups to
      answer this question.
      - Generally, across sexes and age groups, what are the average hours of sleep
      Americans getting from the years 2003 to 2017?
        We used data from the sexes, age groups, and average hours slept by per day from
      our entire dataset to answer this question."
    )
  )
)

# Page 2 - Side panel with information about the chart.
page_2_side <- sidebarPanel(
  p(
    "Here, you can observe the average amount of sleep during each type of day.
    There are three types of days to choose from: Weekend days and holidays, 
    weekends that are nonholidays, and the average amount of sleep for all days.
  "),
  p(
    "Selecting an option from the dropdown menu shows the data for that category
    below."
  ),
  selectInput(
    inputId = "scattervar",
    label = "Select Plot Variable",
    choices = list(
      "All Averages" = "averages",
      "Weekend Days & Holidays" = "w_and_h",
      "Nonholiday Weekends" = "n_w",
      "All days" = "all_days"
    ),
    selected = "averages"
  )
)

# Page 2 - 
page_2_main <- mainPanel(
  plotlyOutput("scatter")
)

# Page 2 - 
page_2 <- tabPanel(
  "Types of Days vs. Avg Hours Slept",
  h2("Types of Days vs. Average Hours Slept per Day"),
  sidebarLayout(
    page_2_side,
    page_2_main
  )
)


# Page 3 - side - some description about the chart & 
#               - provide list to select (Sleep Trend vs. Age Group)
page_3_side <- sidebarPanel(
  p(
  "The interactive graph to the right depicts the trend of average sleep
    hours in each age group. The default is set to compare these trends between 
    age groups. Hover to see the exact average amount of
    sleep hours in each year"),
  p(
    "You can see the sleep hours trend for a specific age group by selecting
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

#Page 4 - Interactive Bar Chart that allows you to select a year to compare
#sleep received by all the age groups in the data. Also lets you compare if the
#amount of sleep varied from year to year
page_4_side <- sidebarPanel(
  p(
    "The interactive barplot on this page offers a visualization of the average
    amount of sleep various age groups of Americans got during the selected
    year. Users can pick a year of their choice in order to compare the sleep
    received by each age group. Users can also hover over the bars in order to 
    get the exact averages for each group. From observing data from various 
    years we can also analyze whether there are any visually notable differences
    between the years in terms of how much sleep Americans got."
  ),
  h2("Select a Year"),
  radioButtons(
    inputId = "selectedYear",
    label = h3("Year"),
    choices = list(
      "2003" = 2003, "2004" = 2004, "2005" = 2005, "2006" = 2006, 
      "2007" = 2007, "2008" = 2007, "2009" = 2009, "2010" = 2010,
      "2011" = 2011, "2012" = 2012, "2013" = 2013, "2014" = 2014,
      "2015" = 2015, "2016" = 2016, "2017" = 2017
    ),
    selected = 2003
  )
)

page_4_main <- mainPanel(
  h1(paste0("Have American Sleep Patterns Changed Over the Years?"),
     plotlyOutput("year_barplot")
  ))

page_4 <- tabPanel(
  "Matt's Page",
  sidebarLayout(
    sidebarPanel =  page_4_side,
    mainPanel = page_4_main)
)

# conclusion_page <- tabPanel()


# Create ui with all the pages we need
ui <- fluidPage(
  includeCSS("style.css"),
   navbarPage(
  intro_page,
  page_2,
  page_3,
  page_4
)
)
