df_data <- dplyr::bind_rows(df_historical_rankings, df_data)

df_data <-
  df_data %>% group_by(guide_agg) %>%
  mutate(max_year = max(year)) %>%
  ungroup() %>% 
  mutate(is_ranking_current = if_else(year == max_year, 1, 0))

df_data <- 
  df_data %>% mutate(
                  is_part_of_dentons = if_else(as.integer(is_part_of_dentons) == 1, "Yes", "No"),
                  is_ranking_current = if_else(year == max_year, 1, 0),
                  is_ranking_current = if_else(as.integer(is_ranking_current) == 1, "Yes", "No")
                  )