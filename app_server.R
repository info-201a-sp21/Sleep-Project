source("scripts/aggregate_table.R")
source("scripts/avg time slept pie chart.R")
source("scripts/summary_info.R")
source("scripts/trend of avg sleep hr in each age group.R")
source("scripts/types of days vs avg time slept.R")
source("scripts/build_trend_chart.R")
source("scripts/get_point_plot.R")
source("scripts/build_bar_chart_and_table.R")


american_time_use_survey_df <- read.csv(
  "data/Time Americans Spend Sleeping.csv",
  stringsAsFactors = FALSE
)

sleep_study_df <- read.csv("data/SleepStudyData.csv",
                           stringsAsFactors = FALSE
)

server <- function(input, output) {

  # pg 1. server code
  output$scatter <- renderPlotly({
    return(get_point_plot(american_time_use_survey_df, input$scattervar))
  })



  # add sleep hr trend chart for each age group into output
  # (took age_cat from input)
  output$show_trend <- renderPlotly({
    return(build_chart(american_time_use_survey_df, input$age_cate))
  })

  # page 4. Server code
  output$get_barplot <- renderPlotly({
    return(get_bar_chart_and_table(american_time_use_survey_df, 1))
  })

  output$get_table <- renderTable({
    return(get_bar_chart_and_table(american_time_use_survey_df, 2))

  })
  
  filename1 <- normalizePath(file.path("images", "hourssleepinggraph.png"))
  filename2 <- normalizePath(file.path("images", "scatterplot1.png"))
  filename3 <- normalizePath(file.path("images", "linegraph.png"))
  
  output$barplot_img <- renderImage({
    list(src = filename1,
         contentType = "image/png")
  }, deleteFile = FALSE)
  
  output$scatter_plot_img <- renderImage({
    list(src = filename2,
         contentType = "image/png")
  }, deleteFile = FALSE)
  
  output$linegraph_img <- renderImage({
    list(src = filename3,
         contentType = "image/png")
  }, deleteFile = FALSE)

}

