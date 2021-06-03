library("dplyr")
library("ggplot2")
library("plotly")

get_point_plot <- function(dataset, dataCategory) {
  
  if (dataCategory != "averages") {
    different_categories <- dataset %>%
      filter(Type.of.Days == dataCategory)
    
    plot1 <- ggplot(data = different_categories, mapping = aes(
      x = Avg.hrs.per.day.sleeping,
      y = Type.of.Days 
    )) + 
      labs(
      title = paste0("Types of Days vs. Average Hours Slept per Day: ",
                     dataCategory),
      x = "Average Hours Slept per Day",
      y = "Types of Days"
    )

  plot_with_points1 <- plot1 +
    geom_jitter(shape = 16) +
    stat_summary(fun = mean, geom = "point", shape = 16, size = 4, color =
                 "red")
  interactive_point1 <- ggplotly(plot_with_points1)
  return(interactive_point1)
  
  } else {
    
  
  plot2 <- ggplot(data = dataset, mapping = aes(
    x = Avg.hrs.per.day.sleeping,
    y = Type.of.Days
  )) +
    labs(
      title = "Types of Days vs. Average Hours Slept per Day",
      x = "Average Hours Slept per Day",
      y = "Types of Days"
    )
  
  plot_with_points2 <- plot +
    geom_jitter(shape = 16) +
    stat_summary(fun = mean, geom = "point", shape = 16, size = 4, color =
                   "red")
  interactive_point2 <- ggplotly(plot_with_points2)
  return(interactive_point2)
  }
}