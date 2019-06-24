df_practice_dict_legal <- df_practice_dict %>% filter(directory == publisher) %>% select(-directory)

df_data <- dplyr::left_join(x = df_data,
                            y = df_practice_dict_legal,
                            by = c("directory_practice" = "practice_original"))



# save unmatched records --------------------------------------------------

df_practice_unmatched <-
  df_data %>% filter(is.na(dentons_practice)) %>% select(publisher, directory_practice) %>% group_by(publisher, directory_practice) %>% summarise()

write.csv(df_practice_unmatched,
          "./data/unmatched/practices_unmatched.csv",
          row.names = F)
