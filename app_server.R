source("scripts/aggregate_table.R")
source("scripts/avg time slept pie chart.R")
source("scripts/summary_info.R")
source("scripts/trend of avg sleep hr in each age group.R")
source("scripts/types of days vs avg time slept.R")
source("scripts/build_trend_chart.R")

american_time_use_survey_df <- read.csv(
  "data/Time Americans Spend Sleeping.csv",
  stringsAsFactors = FALSE
)

sleep_study_df <- read.csv("data/SleepStudyData.csv",
                           stringsAsFactors = FALSE
)

server <- function(input, output) {
  output$
  get_point_plot(american_time_use_survey_df)
  
  
  # add sleep hr trend chart for each age group into output
  # (took age_cat from input)
  output$show_trend <- renderPlotly({
    return(build_chart(american_time_use_survey_df, input$age_cate))
  })
  # p.4 server code
  year_data <- reactive({
    req(input$selectedYear)
    new_df <- american_time_use_survey_df %>%
      filter(Year %in% input$selectedYear) %>%
      group_by(Age.Group) %>%
      summarise(
        avg_sleep = mean(Avg.hrs.per.day.sleeping)
      )
  })
  output$year_barplot <- renderPlotly({
    p4_barplot <- ggplot(year_data(), aes(y = avg_sleep, x = Age.Group,
                                          text = paste(avg_sleep, "Hours"))) + 
      geom_col() + coord_flip() + labs(
        title = paste("Average Hours Slept in America in", input$selectedYear), 
        x = "Age Group", y = "Average Hours Slept per Day")
    int_p4_bp <- ggplotly(p4_barplot, tooltip = "text")
    return(int_p4_bp)
  })
} ##### <- our function ends here!!


  