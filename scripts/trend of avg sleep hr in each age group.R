
get_trend_line_plot <- function(dataset) {
  
  plot <- ggplot(data = dataset) +
    geom_smooth(mapping = aes(x = Year, y = Avg.hrs.per.day.sleeping,
                              color = Age.Group), se = FALSE)
  return(plot)
}
