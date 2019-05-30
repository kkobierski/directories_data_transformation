publisher <- "Legal 500"
guide <- "Legal 500 US 2019"



df_data <-
  df_legal_raw %>% unite(
    "directory_practice",
    c("legal_500_practice_area", "specific_practice_area"),
    sep = ": "
  ) %>% mutate(
    publisher = publisher,
    guide = guide,
    directory_region = country,
    ranking = if_else(
      table_type == "Recommended firms",
      as.character(legal_500_tier_ranking),
      table_type
    )
  ) %>% select(
    year,
    firm_name,
    publisher,
    guide,
    directory_practice,
    directory_region,
    ranking,
    lawyer_name
  )
