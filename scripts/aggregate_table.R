library("dplyr")

#summary table grouped by age
summary_table <- function(df){
  aggregate_df <- df %>%
    select(Avg.hrs.per.day.sleeping, Age.Group) %>%
    group_by(Age.Group) %>%
    summarize(count = n(),
              avg_sleep = mean(Avg.hrs.per.day.sleeping),
              sleep_variance = var(Avg.hrs.per.day.sleeping),
              sleep_SD = sd(Avg.hrs.per.day.sleeping)
              ) %>%
    arrange(-avg_sleep)
  return(aggregate_df)
}


