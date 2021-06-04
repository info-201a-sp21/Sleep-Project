library("dplyr")
library("ggplot2")
library("plotly")

get_point_plot <- function(dataset, dataCategory) {
  
  if (dataCategory == "w_and_h") {
    different_categories <- dataset %>%
      filter(Type.of.Days == "Weekend days and holidays")
    
    plot1 <- ggplot(data = different_categories, mapping = aes(
      x = Avg.hrs.per.day.sleeping,
      y = Type.of.Days 
    )) + 
      labs(
        title = paste0("Types of Days vs. Average Hours Slept per Day:
                     Weekend Days and Holidays"),
        x = "Average Hours Slept per Day",
        y = "Types of Days"
    )

  plot_with_points1 <- plot1 +
    geom_jitter(shape = 16, color = "#406E8E") +
    stat_summary(fun = mean, geom = "point", shape = 16, size = 4, color =
                 "red")
  interactive_point1 <- ggplotly(plot_with_points1)
  return(interactive_point1)
  
  } else if (dataCategory == "n_w") {
    different_categories <- dataset %>%
      filter(Type.of.Days == "Nonholiday weekdays")
    
    plot2 <- ggplot(data = different_categories, mapping = aes(
      x = Avg.hrs.per.day.sleeping,
      y = Type.of.Days 
    )) + 
      labs(
        title = paste0("Types of Days vs. Average Hours Slept per Day:
                       Nonholiday Weekdays"),
        x = "Average Hours Slept per Day",
        y = "Types of Days"
    )
    
    plot_with_points2 <- plot2 +
      geom_jitter(shape = 16, color = "#23395B") +
      stat_summary(fun = mean, geom = "point", shape = 16, size = 4, color =
                     "red")
    interactive_point2 <- ggplotly(plot_with_points2)
    return(interactive_point2)

  } else if (dataCategory == "all_days") {
    different_categories <- dataset %>%
      filter(Type.of.Days == "All days")
    
    plot3 <- ggplot(data = different_categories, mapping = aes(
      x = Avg.hrs.per.day.sleeping,
      y = Type.of.Days 
    )) + 
      labs(
        title = paste0("Types of Days vs. Average Hours Slept per Day:
                       Average Across all Days of The Week"),
        x = "Average Hours Slept per Day",
        y = "Types of Days"
      )
    
    plot_with_points3 <- plot3 +
      geom_jitter(shape = 16, color = "#4174BF") +
      stat_summary(fun = mean, geom = "point", shape = 16, size = 4, color =
                     "red")
    interactive_point3 <- ggplotly(plot_with_points3)
    return(interactive_point3) 
    
    
  } else {
    
  
  plot4 <- ggplot(data = dataset, mapping = aes(
    x = Avg.hrs.per.day.sleeping,
    y = Type.of.Days
  )) +
    labs(
      title = "Types of Days vs. Average Hours Slept per Day",
      x = "Average Hours Slept per Day",
      y = "Types of Days"
    )
  
  plot_with_points4 <- plot4 +
    geom_jitter(shape = 16, color = "#8EA8C3") +
    stat_summary(fun = mean, geom = "point", shape = 16, size = 4, color =
                   "red")
  interactive_point4 <- ggplotly(plot_with_points4)
  return(interactive_point4)
  }
}