#UI Code
page_4_side <- sidebarPanel(
  h2("Select a Year"),
  radioButtons(
    inputId = "Year1",
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
  h1("American Sleeping Habits Through the Years"),
  plotlyOutput("year_barplot")
)

page_4 <- tabPanel(
  "Sleep Trends by Year",
  sidebarLayout(
    page_4_side,
    page_4_main
  )
)

#Server Code
server <- function(input, output) {
  year_df <- group_by(american_time_use_survey_df, Year)
  year_df1 <- reactive({dplyr::filter(year_df, Year == input$"Year1")})
  output$year_barplot <- renderPlotly({
    barplot <- plot_ly(
    data = year_df1
    x = ~Age.Group,
    y = ~Avg.hrs.per.day.sleeping,
    type = 'bar',
    mode = 'markers'
  ) %>%
  layout(
    title = paste0("Amount Americans Slept in ", input$Year1),
    xaxis = list(title = "Age Group")
    yaxis = list(title = "Average Hours per Day Sleeping")
  )
  return(barplot)
})
}

# Plotly code - bar chart (x = age group, y = avg hrs of sleep, input = year)
year_df <- group_by(american_time_use_survey_df, Year)

bar_chart <- plot_ly(
  data = year_df
  x = ~Age.Group,
  y = ~Avg.hrs.per.day.sleeping,
  type = 'bar',
  mode = 'markers'
)
