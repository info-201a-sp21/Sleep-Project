library("dplyr")

#summary table grouped by age and year
summary_table <- function(df){
  aggregate_df <- df %>%
    select(Year, Avg.hrs.per.day.sleeping, Age.Group) %>%
    group_by(Age.Group, Year) %>%
    summarize(count = n(),
              avg_sleep = mean(Avg.hrs.per.day.sleeping)
    )
  return(aggregate_df)
}

