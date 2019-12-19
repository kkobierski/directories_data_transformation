source("load_packages.R")


tic()
source("settings.R")
source("get_data.R")

top_rankings <- c("1", "2", "Eminent Practitioner", "Ranked Individual", "Senior Statespeople", "Star Associate", "Star Individual", "Leading Individuals")

file_path_bands_dict <- "/Users/ombre/Documents/dentons/renata report/rankings_hierarchy.csv"
df_bands_dict <- read.csv(file_path_bands_dict, stringsAsFactors = F, sep = ";")
df_bands_dict_f <- df_bands_dict %>% filter(level == "Firm level")
df_bands_dict_i <- df_bands_dict %>% filter(level == "Individual level")

current_data <- df_historical_rankings %>% filter(is_ranking_current == 1, !firm_name %in% c("Gustavo Zacapa y Asociados, Abogados & Notarios", "Gustavo Zacapa y Asociados","Jimenez de Arechaga, Viana + Brause" ,"Rattagan Macchiavello Arocena"))
curr_dentons <- current_data %>% filter(is_part_of_dentons == 1) %>% 
  mutate(ranking = replace(ranking, special_ranking == "Elite", "Band 1")) %>% 
  mutate(ranking = replace(ranking, special_ranking == "Highly Regarder", "Band 1")) %>% 
  mutate(ranking_aggregated = replace(ranking_aggregated, special_ranking == "Elite", "1")) %>% 
  mutate(ranking_aggregated = replace(ranking_aggregated, special_ranking == "Highly Regarder", "1")) 



curr_dentons_f <- curr_dentons %>% filter(level == "Firm level")
curr_dentons_f_top <- curr_dentons %>% filter(level == "Firm level", ranking_aggregated %in% top_rankings)

curr_dentons_i <- curr_dentons %>% filter(level == "Individual level")
curr_dentons_i_top <- curr_dentons %>% filter(level == "Individual level", ranking_aggregated %in% top_rankings)

rankings_weighting <- function(df, dict){

  df$ranking <- tolower(df$ranking)
  dict$ranking <- tolower(dict$ranking)
    
  df <- dplyr::left_join(df,
                        dict %>% select(ranking, weight),
                        by = c("ranking" = "ranking"))
  
 
  df_final <- df %>% group_by(dentons_practice, dentons_region, ranking, weight) %>%
    summarise(n = n()) %>% mutate(sum_weighted = weight * n) %>%
    group_by(dentons_practice, dentons_region) %>%
    summarise(sum_t = sum(n, na.rm = T), sum_w = sum(sum_weighted, na.rm = T)) %>%
    mutate(weighted_sum = round(sum_w/sum_t, 2)) %>%
    select(dentons_practice, dentons_region, weighted_sum) 
  
  return(df_final)
  
}

firm_all <- rankings_weighting(curr_dentons_f, df_bands_dict_f) %>% mutate(level = "Firm all")
firm_top <- rankings_weighting(curr_dentons_f_top, df_bands_dict_f) %>% mutate(level = "Firm top")
lawyers_all <- rankings_weighting(curr_dentons_i, df_bands_dict_i) %>% mutate(level = "Individual all")
lawyers_top <- rankings_weighting(curr_dentons_i_top, df_bands_dict_i) %>% mutate(level = "Individual top")


df_final <- dplyr::bind_rows(firm_all, firm_top, lawyers_all, lawyers_top)


write.table(df_final, "reports/dots_all_practice.csv", row.names = F, sep = ";")


x <- seq(from = 1, to = 5, by = 0.1)

quantile(x, prob = c(0.33, 0.67, 0.99))
