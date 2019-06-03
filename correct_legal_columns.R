publisher <- "Legal 500"
guide_agg <- "Legal 500 US"



df_data <-
  df_legal_raw %>% unite(
    "directory_practice",
    c("legal_500_practice_area", "specific_practice_area"),
    sep = ": "
  ) %>% mutate(
    publisher = publisher,
    guide_agg = guide_agg,
    guide = paste0(guide_agg, " ", year),
    directory_region = country,
    ranking = if_else(
      table_type == "Recommended firms",
      paste0("Tire ", legal_500_tier_ranking),
      table_type
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
    lawyer_name
  )

df_data$lawyer_name <- gsub(" - ", "", df_data$lawyer_name)

#### resolve issue with CMS, currently you are selecting only one value, need to make sure you extract all of the names variations. LAternatively use IDs
df_data <-
  df_data %>% filter(
    firm_name %in% firms_list_competition |
      firm_name %in% firms_list_dentons)
