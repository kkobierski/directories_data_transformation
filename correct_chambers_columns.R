df_chambers_data$desc <- 
  gsub("\t", "", df_chambers_data$desc)

df_data <- 
  df_chambers_data %>% filter(desc != "", desc != "desc")

df_data$firm_id <- as.integer(df_data$firm_id)
df_data$parent_firm_id <- as.integer(df_data$parent_firm_id)
df_data$publication_id <- as.integer(df_data$publication_id)

df_data <- df_data %>% mutate(firm_id = if_else(is.na(parent_firm_id), firm_id, parent_firm_id))

df_chambers_publications_dict_s <-
  df_chambers_publications_dict %>% filter(active == "TRUE") %>% select(publicationTypeId, publicationTypeDescription, description)

df_data <- dplyr::left_join(df_data,
                            df_chambers_publications_dict_s,
                            by = c("publication_id" = "publicationTypeId"))


df_data <-dplyr::left_join(df_data,
                           df_chambers_firms_dict,
                           by = c("firm_id", "firm_id"))

df_data <- df_data %>% mutate(
  year = as.integer(right(description,4)),
  ranking = rank_desc,
  ranking_agg = if_else(rank_desc %like% "Band", gsub("Band ", "", rank_desc), rank_desc),
  publisher = publisher_chambers,
  guide_agg = paste("Chambers", publicationTypeDescription, sep = " "),
  guide = if_else(description %like% "Chambers",description,  paste("Chambers", description, sep = " ")),
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
  lawyer_name,
  is_part_of_dentons
)
