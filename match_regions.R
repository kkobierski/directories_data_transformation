df_data <- dplyr::left_join(x = df_data,
                            y = df_regions_dict,
                            by = c("directory_region" = "directory_region"))


# save unmatched records --------------------------------------------------

df_regions_unmatched <-
  df_data %>% filter(is.na(dentons_region)) %>% select(publisher, directory_region) %>% group_by(publisher, directory_region) %>% summarise()

write.csv(df_regions_unmatched,
          "./data/unmatched/regions_unmatched.csv",
          row.names = F)
