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
}

  