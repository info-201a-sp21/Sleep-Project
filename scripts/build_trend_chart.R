library(dplyr)
library(ggplot2)
library(plotly)

build_chart <- function(dataset, selected_age) {

  trend_of_avg_hrs_of_all_age <- dataset %>%
    group_by(Year, Age.Group) %>%
    summarize(
      avg_sleep_hr_per_age_group_per_year = mean(Avg.hrs.per.day.sleeping)
    )

  if (selected_age != "overall") {
    trend_of_avg_hrs_per_age_group <- trend_of_avg_hrs_of_all_age %>%
      filter(Age.Group == selected_age)

    plot1 <- ggplot(data = trend_of_avg_hrs_per_age_group,
                    mapping = aes(x = Year,
                                  y = avg_sleep_hr_per_age_group_per_year)) +
      geom_line(color = "#3366FF") +
      labs(
        title = paste0("Trend of Average Sleep Hours in Age Group: ",
                       selected_age),
        x = "Year",
        y = "Average Hours per Day Sleeping"
      )

    interactive_plot1 <- ggplotly(plot1)
    return(interactive_plot1)

  } else {
    plot2 <- ggplot(data = trend_of_avg_hrs_of_all_age) +
      geom_line(mapping = aes(x = Year,
                              y = avg_sleep_hr_per_age_group_per_year,
                              color = Age.Group)) +
      labs(
        title = "Trend of Average Sleep Hours In Each Age Group",
        x = "Year",
        y = "Average Hours per Day Sleeping",
        color = "Age Group"
      )

    interactive_plot2 <- ggplotly(plot2)
    return(interactive_plot2)
  }
}
