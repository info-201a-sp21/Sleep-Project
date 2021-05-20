library(dplyr)
library(ggplot2)

sleep_df <- read.csv("data/Time Americans Spend Sleeping.csv",
                     stringsAsFactors = FALSE)

sleep_study_df <- read.csv("data/SleepStudyData.csv",
                           stringsAsFactors = FALSE)


get_summary_info <- function(dataset) {
  result <- list()

  phoneuser_info <- sleep_study_df %>% filter(PhoneTime == "Yes") %>%
    mutate(answer = as.numeric(Enough == "Yes")) %>%
    summarize(
      avg_sleep_hr = mean(Hours, na.rm = TRUE),
      avg_enough = sum(answer, na.rm = TRUE) / 
        length(!is.na(Enough))
    )
  
   non_phoneuser_info <- sleep_study_df %>% filter(PhoneTime == "No") %>%
    mutate(answer = as.numeric(Enough == "Yes")) %>%
    summarize(
      avg_sleep_hr = mean(Hours, na.rm = TRUE),
      avg_enough = sum(answer, na.rm = TRUE) /
        length(!is.na(Enough))
    )
   
  breakfast_info <- sleep_study_df %>% filter(Breakfast == "Yes") %>%
    mutate(answer = as.numeric(Enough == "Yes")) %>%
    summarize(
      avg_sleep_hr = mean(Hours, na.rm = TRUE),
      avg_enough = sum(answer, na.rm = TRUE) / 
        length(!is.na(Enough))
    )
  
  non_breakfast_info <- sleep_study_df %>% filter(Breakfast == "No") %>%
    mutate(answer = as.numeric(Enough == "Yes")) %>%
    summarize(
      avg_sleep_hr = mean(Hours, na.rm = TRUE),
      avg_enough = sum(answer, na.rm = TRUE) /
        length(!is.na(Enough))
    )
 
  result$avg_enough_sleephr <- sleep_study_df %>%
    filter(Enough == "Yes") %>%
    summarize(
      avg_enough_sleep_hr = mean(Hours, na.rm = TRUE)
    ) %>% pull()
  
  avg_phoneuser_sleep_hr <- phoneuser_info %>% pull(avg_sleep_hr)
  avg_non_phoneuser_sleep_hr <- non_phoneuser_info %>%
    pull(avg_sleep_hr)
  
  
  avg_phoneuser_enough_rate <- phoneuser_info %>% pull(avg_enough)
  avg_non_phoneuser_enough_rate <- non_phoneuser_info %>%
    pull(avg_enough)
  
  result$avg_phoneuser_sleep_hr <- round(avg_phoneuser_sleep_hr, 3)
  result$avg_non_phoneuser_sleep_hr <- round(avg_non_phoneuser_sleep_hr, 3)
  
  result$avg_phoneuser_enough_rate <- round(avg_phoneuser_enough_rate, 3)
  result$avg_non_phoneuser_enough_rate <- round(
    avg_non_phoneuser_enough_rate, 3)
  
  
  avg_breakfast_sleep_hr <- breakfast_info %>% pull(avg_sleep_hr)
  avg_non_breakfast_sleep_hr <- non_breakfast_info %>%
    pull(avg_sleep_hr)
  
  avg_breakfast_enough_rate <- breakfast_info %>% pull(avg_enough)
  avg_non_breakfast_enough_rate <- non_breakfast_info %>%
    pull(avg_enough)
  
  result$avg_breakfast_sleep_hr <- round(avg_breakfast_sleep_hr, 3)
  result$avg_non_breakfast_sleep_hr <- round(avg_non_breakfast_sleep_hr, 3)
  
  result$avg_breakfast_enough_rate <- round(avg_breakfast_enough_rate, 3)
  result$avg_non_breakfast_enough_rate <-round(avg_non_breakfast_enough_rate, 3)
  
  result$breakfast_sleephr_ratio <- round(result$avg_breakfast_sleep_hr /
    result$avg_non_breakfast_sleep_hr, 2)
  
  result$breakfast_enough_ratio <- round(result$avg_breakfast_enough_rate /
    result$avg_non_breakfast_enough_rate, 2)
  
  return(result)

}

get_summary_info(sleep_df)

