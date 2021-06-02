page_2_side <- sidebarPanel(
  selectInput(
    "scattervar",
    label = "Select Plot Variable",
    choices = list(
      "Weekend Days & Holidays" = "w_and_h",
      "Nonholiday Weekends" = "n_w",
      "All days" = "all_days"
    )
  )
)

page_2_main <- mainPanel(
  renderPlotly("scatter")
)

page_2 <- tabPanel(
  "Types of Days vs. Avg Hours Slept",
  titlePanel("Types of Days vs. Average Hours Slept per Day"),
  sidebarLayout(
    page_2,
    page_2_main
  )
)

ui <- navbarPage(
  "Investigating Sleep Habits",
  page_2
)