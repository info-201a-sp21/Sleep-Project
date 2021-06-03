library(ggplot2)
library(dplyr)
library(plotly)


get_bar_chart_and_table <- function(dataset, selection) {
  avg_hours_df <- dataset %>%
    mutate(sleep_hour = floor(Avg.hrs.per.day.sleeping))

  total_num <- length(avg_hours_df$sleep_hour)

  get_frequency_and_percent <- avg_hours_df %>%
    group_by(sleep_hour) %>%
    summarize(
      frequency = n(),
      percentage = round((n() / total_num) * 100, digits = 2)
    )

  if (selection == FALSE) {
    avg_sleep_barchart <- ggplot(data = get_frequency_and_percent,
                                 mapping = aes(x = sleep_hour,
                                               y = frequency,
                                               fill = percentage)) +
      geom_bar(stat = "identity") +
      labs(
        title = "Hours American Spend Sleeping",
        x = "Sleep Hour",
        y = "Number of People",
        fill = "Percentage"
      )

    interactive_plot <- ggplotly(avg_sleep_barchart)
    return(interactive_plot)

  } else {
    table_df <- get_frequency_and_percent %>%
      rename("Sleep Hours" = sleep_hour,
             "Number of People" = frequency,
             "Percentage" = percentage)
    return(table_df)
  }
}

