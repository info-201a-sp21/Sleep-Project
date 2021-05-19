avg_time_slept <- read.csv(
  "https://raw.githubusercontent.com/info-201a-sp21/Sleep-Project
/master/data/Time%20Americans%20Spend%20Sleeping.csv",
  stringsAsFactors = FALSE
)

library("dplyr")
library("ggplot2")
library("leaflet")
library("plotly")

#data I'm working with
avg_hours_slept <- select(avg_time_slept, Avg.hrs.per.day.sleeping)

#rounding the data
seven_hours <- avg_time_slept[avg_time_slept$Avg.hrs.per.day.sleeping >= 7 & 
                                avg_time_slept$Avg.hrs.per.day.sleeping <= 7.999,]
seven_hrs_perc <- (nrow(seven_hours) / nrow(avg_hours_slept)) * 100

eight_hours <- avg_time_slept[avg_time_slept$Avg.hrs.per.day.sleeping >= 8 & 
                                avg_time_slept$Avg.hrs.per.day.sleeping <= 8.999,]
eight_hrs_perc <- (nrow(eight_hours) / nrow(avg_hours_slept)) * 100

nine_hours <- avg_time_slept[avg_time_slept$Avg.hrs.per.day.sleeping >= 9 & 
                               avg_time_slept$Avg.hrs.per.day.sleeping <= 9.999,]
nine_hrs_perc <- (nrow(nine_hours) / nrow(avg_hours_slept)) * 100

ten_hours <- avg_time_slept[avg_time_slept$Avg.hrs.per.day.sleeping >= 10 & 
                              avg_time_slept$Avg.hrs.per.day.sleeping <= 10.999,]
ten_hrs_perc <- (nrow(seven_hours) / nrow(avg_hours_slept)) * 100

#making  the dataframe
Hours_slept <- c("seven hours" = seven_hrs_perc, "eight hours" = eight_hrs_perc, 
                 "nine hours" = nine_hrs_perc, "ten hours" = ten_hrs_perc)


avg_hours_df <- avg_time_slept %>%
  mutate(sleep_buckets = floor(Avg.hrs.per.day.sleeping))

avg_sleep_pie <- ggplot(avg_hours_df, aes(x = factor(1), fill = factor(sleep_buckets))) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")

  