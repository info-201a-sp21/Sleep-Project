library("dplyr")
library("ggplot2")
library(leaflet)
library(plotly)

sleep_data <- read.csv(
"https://raw.githubusercontent.com/info-201a-sp21/Sleep-Project
/master/data/Time%20Americans%20Spend%20Sleeping.csv",
  stringsAsFactors = FALSE
)

mean_hours <- sleep_data %>%
  summarize(Avg.hrs.per.day.sleeping)

ggplot(data = sleep_data) +
  geom_violin(mapping = aes(x = Avg.hrs.per.day.sleeping, y = Type.of.Days)) +
  ggtitle("Types of Days vs. Average Hours Slept per Day") + 
  xlab("Average Hours Slept per Day") +
  ylab("Types of Days") + 
  geom_jitter(shape = 5, position = position_jitter(0.2))


mean_plot <- ggplot(data = sleep_data, 
  mapping = aes(x = Avg.hrs.per.day.sleeping, y = Type.of.Days)
) +
  geom_violin(trim = FALSE) +
  ggtitle("Types of Days vs. Average Hours Slept per Day") + 
  xlab("Average Hours Slept per Day") +
  ylab("Types of Days") 

mean_plot +
  geom_jitter(shape = 16, position = position_jitter(0))


