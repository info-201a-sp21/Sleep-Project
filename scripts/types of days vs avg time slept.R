library("dplyr")
library("ggplot2")
library("plotly")

get_point_plot <- function(dataset) {
  plot <- ggplot(data = dataset, mapping = aes(
    x = Avg.hrs.per.day.sleeping,
    y = Type.of.Days
  )) +
    labs(
      title = "Types of Days vs. Average Hours Slept per Day",
      x = "Average Hours Slept per Day",
      y = "Types of Days"
    )

  plot_with_points <- plot +
    geom_jitter(shape = 16) +
    stat_summary(fun = mean, geom = "point", shape = 16, size = 4, color =
                   "red")
  interactive_point <- ggplotly(plot_with_points)
  return(interactive_point)
}

