
df_data <-
  df_data %>% mutate(
                    year_published = if_else(guide_agg %in% year_publisged_dict, as.integer(year-1), year),
                    ranking_aggregated = if_else(publisher == "Legal 500",
                                                   gsub("Tier ", "", ranking),
                                                   gsub("Band ", "", ranking)
                                                   ),
                    level = if_else(lawyer_name == "", "Firm level", "Individual level")
                     )

df_data <-
  df_data %>% mutate(firm_agg = 
                        if_else(is_part_of_dentons == 1, "Dentons", 
                        if_else(firm_name %like% 'Baker', 'Baker McKenzie',
                        if_else(firm_name %like% 'CMS', 'CMS',
                        if_else(firm_name %like% 'DLA Piper', 'DLA Piper', 
                        if_else(firm_name %like% 'Clifford Chance', 'Clifford Chance',
                        if_else(firm_name %like% 'Eversheds', 'Eversheds Sutherland',
                        if_else(firm_name %like% 'Norton Rose Fulbright', 'Norton Rose Fulbright', 
                        if_else(firm_name %like% 'Hogan Lovells', 'Hogan Lovells',
                        firm_name)))))))))


