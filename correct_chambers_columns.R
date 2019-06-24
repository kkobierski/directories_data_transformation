df_data <- 
  df_chambers_data %>% filter(desc != "desc")

df_data$firm_id <- as.integer(df_data$firm_id)
df_data$publication_id <- as.integer(df_data$publication_id)

df_chambers_publications_dict_s <-
  df_chambers_publications_dict %>% filter(active == "True") %>% select(publicationTypeId, publicationTypeDescription)

df_data <- dplyr::left_join(df_data,
                            df_chambers_publications_dict_s,
                            by = c("publication_id" = "publicationTypeId"))

df_data <-dplyr::left_join(df_data,
                           df_chambers_firms_dict,
                           by = c("firm_id"))
df_data <- df_data %>% mutate(
  year = year_sys,
  ranking = rank_desc,
  ranking_agg = if_else(rank_desc %like% "Band", gsub("Band ", "", rank_desc), rank_desc),
  publisher = publisher_chambers,
  guide_agg = paste(guide_chambers, publicationTypeDescription, sep = " "),
  guide = paste(guide_chambers, publicationTypeDescription, year_sys, sep = " "),
  directory_practice = practice_desc,
  directory_region = loc_desc,
  lawyer_name = person_name
) %>% select(
  year,
  firm_name,
  publisher,
  guide,
  guide_agg,
  directory_practice,
  directory_region,
  ranking,
  lawyer_name
)
