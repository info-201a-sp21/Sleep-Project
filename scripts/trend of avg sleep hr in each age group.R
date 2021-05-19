
library(dplyr)
library(ggplot2)
library(plotly)


sleep_df <- read.csv("data/Time Americans Spend Sleeping.csv",
                     stringsAsFactors = FALSE)

get_trend_line_plot <- function(dataset) {

  plot <- ggplot(data = dataset) +
    geom_smooth(mapping = aes(x = Year, y = Avg.hrs.per.day.sleeping,
                              color = Age.Group), se = FALSE) +
    labs(
      title = "Trend of Average Sleep Hour In Each Age Group",
      x = "Year",
      y = "Average Hours per Day Sleeping",
      color = "Age Group"
    )

  interactive_plot <- ggplotly(plot)
  return(interactive_plot)
}


