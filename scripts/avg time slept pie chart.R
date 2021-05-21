library(ggplot2)
library(dplyr)

get_pie_chart <- function(dataset) {
  avg_hours_df <- dataset %>%
    mutate(sleep_buckets = floor(Avg.hrs.per.day.sleeping))

  avg_sleep_chart <- ggplot(
    avg_hours_df,
    aes(x = factor(1), fill = factor(sleep_buckets))
  ) +
    geom_bar(width = 1) +
    coord_polar(theta = "y") +
    scale_fill_manual(
      values = c("#785EF0", "#DC267F", "#FE6100", "#FFB000"),
      name = " Hours of Sleep (rounded to nearest hour)",
      labels = c("7 Hours", "8 Hours", "9 Hours", "10 Hours")
    ) +
    ggtitle("Hours American Spend Sleeping") +
    theme(
      axis.title.x = element_blank(),
      axis.text.x = element_blank(),
      axis.title.y = element_blank(),
      axis.text.y = element_blank()
    )
  return(avg_sleep_chart)
}

