#loading csv data
avg_time_slept <- read.csv(
  "https://raw.githubusercontent.com/info-201a-sp21/Sleep-Project
/master/data/Time%20Americans%20Spend%20Sleeping.csv",
  stringsAsFactors = FALSE
)

library("dplyr")
library("ggplot2")
library("lintr")

#Creating a column for my specific data
avg_hours_df <- avg_time_slept %>%
  mutate(sleep_buckets = floor(Avg.hrs.per.day.sleeping))

#Building the actual pie chart
avg_sleep_chart <- ggplot(avg_hours_df,
  aes(x = factor(1), fill = factor(sleep_buckets))) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")

#Fixing the visual aspects of the pie chart
avg_sleep_pie <- avg_sleep_chart +
  scale_fill_manual(values = c("#785EF0", "#DC267F", "#FE6100", "#FFB000"),
        name = " Hours of Sleep (rounded to nearest hour)",
        labels = c("7 Hours", "8 Hours", "9 Hours", "10 Hours")) +
  ggtitle("Hours American Spend Sleeping") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank())
