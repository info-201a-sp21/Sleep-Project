library(plotly)
library(shiny)
library("shinyWidgets")

setBackgroundColor(
  color = # 255377
)


# Page 1 - Intro Page - writing introduction for our project
intro_page <- tabPanel(
  "About Our Project",
  tags$img(
    id = "image_sleeping", src =
      "https://forum.facmedicine.com/data/MetaMirrorCache/db5d4dcbb12c091cf69728570a385b92.jpg",
    width = "500px", height = "300px"
  ),
  h1("Introduction"),
  p(
    " The balance between sleep and school or work can becomes extremely
    disrupted. Sleep is highly needed but often sacrificed in order to
    meet deadlines and complete work. Our project seeks to understand if
    this balance between sleep and school or work is highly imbalanced or
    if people are generally able to achieve a healthy amount of sleep."
  ),
  h3("Our Data Source"),
  p(
    "In order to answer these questions about the relationship between Americans
      and sleep, we used data collected from 2003 to 2017 by American Time Use
      Survey from the Bureau of Labor Statistics. The survey gathered data from
      a random sample of Americans of both sexes, ranging from ages 15 to 60
      years and over. Namely, the dataset provides information about the type
      of day respondents reported sleeping, the average hours per day spent
      sleeping, the sex of the respondent,
      their age range, the year the data was collected.
    "
  ),
  h3("Our Major Questions for Our Data"),
  tags$ul(
    tags$li("What are the differences in hours slept between days in general,
      weekends and holidays, and nonholiday weekends?"),
    p("We derived this information from the columns in the dataset that
      pertained to types of days and average hours slept per day
      to answer this question."),
    tags$li("What are the average number of hours slept by each
      age group over the period of 2003-2017?"),
    p("We used the average number of hours slept per day and the age groups to
      answer this question."),
    tags$li("Generally, across sexes and age groups,
      what are the average hours of sleep
      Americans getting from the years 2003 to 2017?"),
    p("We used data from the sexes, age groups, and average
      hours slept by per day from our entire dataset to answer this question.")
  )
)


# Page 2 - Side panel with information about the chart.
page_2_side <- sidebarPanel(
  style = "background-color: #81C4EF",
  p(
    "Here, you can observe the average amount of sleep during each type of day.
    There are three types of days to choose from: Weekend days and holidays,
    weekends that are nonholidays, and the average amount of sleep for all days.
  "
  ),
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

# Page 2 - main Panel with scatter plot
page_2_main <- mainPanel(
  plotlyOutput("scatter"),
)

# Page 2 - combine side and main panel
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
  style = "background-color: #81C4EF",
  p(
    "The interactive line graph to the right depicts the trend of American
    average sleep hours in various age group. From observing data from various
    years we can also analyze whether there are any visually notable differences
    between the years in terms of how much sleep Americans got and each age
    groups.The default is set to compare these trends between all age groups.
    Selecting an age group in dropdown menu will visualize the line graph of
    selected age group. Hover to see the exact average amount of sleep hours
    in each year"
  ),
  p(
    "You can see the Americans' sleep hours trend for a specific age group
    by selecting an age group category below."
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

# Page 4 - side panel for introduction of the bar plot
page_4_side <- sidebarPanel(
  style = "background-color: #81C4EF",
  p(
    "The interactive barplot consolidates the data of average hours slept per
    day from 2003 to 2017. This information was conveyed through a barplot
    because it effectively shows a visual comparison between the different
    amount of hours spent sleeping on average per day. The barplot expresses
    the comparison of these different amounts of hours spent sleeping in order
    to demonstrate how many hours spent sleeping is most common, least common,
    or in between. Hover to see the exact amount of people fall in each
    category."
  ),
  p(
    "In addiion, toggle the button below to display the table view of the data"
  ),
  checkboxInput(
    inputId = "check",
    label = "Display Table",
    value = FALSE
  )
)

# Page 4 - main panel for displaying interactive bar plot
page_4_main <- mainPanel(
  conditionalPanel(
    condition = "input.check == false",
    plotlyOutput("get_barplot")
  ),
  conditionalPanel(
    condition = "input.check == true",
    tableOutput("get_table")
  )
)

# Page 4 - combining main and side panel
page_4 <- tabPanel(
  "Hours American Spend Sleeping",
  h1("How Many Hours American Spend Sleeping on Average? (Year 2003 to 2017)"),
  sidebarLayout(
    page_4_side,
    page_4_main
  )
)

# create conclusion page
conclusion_page <- tabPanel(
  "Takeaways",
  h1("Summary Findings"),
  h3("Sleep is an integral part of our daily function and health,
      but how much sleep are Americans getting? From our data, we found
      three major takeaways that address questions related to exploring the
      relationship between Americans and the average
      number of hours they are sleeping."),
  tags$img(
    id = "americanssleeping_img", src =
      "images/hourssleepinggraph",
    width = "500px", height = "300px"
  ),
  h2("Takeaway 1: Respondents were,
       on average, able to sleep a healthy amount"),
  h3("Question: What was the most common number of hours
     (rounded to the nearest hour) that Americans slept from 2003-2017?"),
  p(
    "Using the How Many Hours Americans Spend Sleeping on Average? graph,
    our research uncovered common hours Americans spent sleeping.
    We found that 8 hours and 9 hours were the most common amount of
    hours spent sleeping on average per day with 7 hours and 10 hours being
    the outliers in the data. However, 8 hours was the most frequent,
    accounting for over half of the data meaning respondents generally
    did not experience significant disturbances that impaired
    them from achieving a healthy amount of sleep.
    By understanding the most common amount of hours spent
    sleeping, we can potentially extrapolate this to gain a general
    understanding of the amount of time most people spend sleeping on average
    and thereby identify if people are generally able to
    sleep a healthy amount."
  ),
  p(
    "Broader Implications: With the prevalence of social media addiction
    and increasing technological usage from the increasing release
    of technology, it may be of value to further investigate if the
    average hours of sleep of Americans lessened from prevalent
    blue-light exposure or smartphone addiction."
  ),
  tags$img(
    id = "scatterplot_img", src =
      "images/scatterplot1.png",
    width = "500px", height = "300px"
  ),
  h2("Takeaway 2: Average Hours of Sleep Changed Depending on the Type of Day"),
  h3("Question: Did the type of day affect the average number of hours slept?"),
  p(
    "From our categorical scatterplot Types of Days vs.
    Average Hours Slept per Day, our data revealed large differences in time
    spent sleeping across three different categories of days. We
    found that the type of day impacted the average number
    of hours slep. The visualization
    reveals that the average sleep for weekends was 9.33 hours, 8.40 hours for
    weekdays, and 8.68 hours across all days. These results tell us that people
    change their sleeping patterns by nearly an hour from weekday to weekend,
    which can negatively affect their circadian rhythm. Changing one's sleep
    patterns can harm sleep health and the data allows us to understand
    why some may be unsatisfied with their sleep."
  ),
  p(
    "Broader implications: It makes sense that Americans generally get less
    sleep on weekdays as compared to weekends seeing as that the workweek tends
    to fall on weekdays.It would be interesting to further investigate if
    Americans feel as though they do not get enough sleep during the weekdays
    which account for the longer hours slept during the weekends."
  ),
  tags$img(
    id = "linegraph_img", src =
      "images/linegraph.png",
    width = "500px", height = "300px"
  ),
  h2("Takeaway 3: 15-24 Age Group's Average Sleep Hours Increased the Most"),
  h3("Question: What are the different sleep patterns of
    the different age groups surveyed?"),
  p(
    "From our Trend of Average Sleep Hours In Each Age Group graph, we gained
    insight into the sleeping patterns of different age groups. It revealed that
    except for the age group of 65 years and over, the average sleep hours for
    most of the age groups tend to rise slightly over the year. The age group of
    65 years and over tends to stay the same while the age group of 15 to 24
    years rises significantly compared to the other age group. These results
    help us to gain an insight that the reason for people having sleeping
    problems nowadays is not from the actual amount of sleep hours
    that they are having."
  ),
  p("Broader Implications: Perhaps there are issues that the 15-24 year old
    age groups faces that are uniquely affecting their sleep pattern that
    would explain the distinct 15-24 year old age group's sleep pattern
    that we found from the data. Significant
    life events could include entering college, graduating college, or entering
    the workforce. This age group's sleep patterns act like an outlier in the
    dataset, being significantly distanced on the graph from the rest of the age
    groups graphed. Thus we see that age groups likely to be in the workforce
    experience very different sleep patterns from the youngest age group
    which is most likely to be impacted by school.")
)


# Create ui with all the pages we need
ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
    "Investigating Sleep Habits",
    intro_page,
    page_2,
    page_3,
    page_4,
    conclusion_page
  )
)
