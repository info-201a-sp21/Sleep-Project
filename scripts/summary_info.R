

get_summary_info <- function(dataset) {
  sleep_df <- read.csv("data/Time Americans Spend Sleeping.csv",
                       stringsAsFactors = FALSE)
  result <- list()
  
  sleep_df %>% group_by(Sex) %>%
    group_by(Age.Group) %>%
    summarize(
      average_hrs_in_particular_sex_age = mean(Avg.hrs.per.day.sleeping)
    )
  
  
  sleep_df %>% filter(Sex == )
  
  
  
}


sleep_df %>% group_by(Sex)

ggplot(data = sleep_df) +
  geom_point(mapping = aes(x = Sex, y = Avg.hrs.per.day.sleeping,
                           color = Avg.hrs.per.day.sleeping),
             position = "jitter")
