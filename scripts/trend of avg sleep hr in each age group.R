
library(dplyr)
library(ggplot2)
library(plotly)


get_trend_line_plot <- function(dataset) {

  trend_of_avg_hrs_per_age_group <- dataset %>%
    group_by(Year, Age.Group) %>%
    summarize(
      avg_sleep_hr_per_age_group_per_year = mean(Avg.hrs.per.day.sleeping)
    )

  plot <- ggplot(data = trend_of_avg_hrs_per_age_group) +
    geom_line(mapping = aes(x = Year,
                            y = avg_sleep_hr_per_age_group_per_year,
                            color = Age.Group)) +
    labs(
      title = "Trend of Average Sleep Hours In Each Age Group",
      x = "Year",
      y = "Average Hours per Day Sleeping",
      color = "Age Group"
    )

  interactive_plot <- ggplotly(plot)
  return(interactive_plot)
}


