publisher <- "Legal 500"
guide_agg <- "Legal 500 Asia Pacific"

colnames(df_legal_raw) <-
  gsub("table_type.*", "table_type", colnames(df_legal_raw))

# df_legal_raw$table_type <-
#   gsub(
#     "Next Generation Lawyers",
#     "Next Generation Partners",
#     df_legal_raw$table_type
#   )

df_data <-
  df_legal_raw %>% mutate(
    is_part_of_dentons = if_else(firm_name %in% firms_list_dentons, 1, 0),
    publisher = publisher,
    guide_agg = guide_agg,
    guide = paste0(guide_agg, " ", year),
    directory_region = country,
    ranking = if_else(
      table_type == "Recommended firms",
      paste0("Tier ", legal_500_tier_ranking),
      table_type
    ),
    directory_practice = if_else(
      table_type == "Recommended firms",
              if_else(legal_500_practice_area == specific_practice_area,
                      legal_500_practice_area,
                      paste(legal_500_practice_area, specific_practice_area, sep = ": ")
              ),
              if_else(legal_500_practice_area == specific_practice_area,
                      legal_500_practice_area,
                      paste(legal_500_practice_area, specific_practice_area, sep = ": "))
              )
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

df_data$lawyer_name <- gsub(" - ", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub("-", "", df_data$lawyer_name)

#### resolve issue with CMS, currently you are selecting only one value, need to make sure you extract all of the names variations. Aternatively use IDs
df_data <-
  df_data %>% filter(
    firm_name %in% firms_list_competition |
      firm_name %in% firms_list_dentons)
