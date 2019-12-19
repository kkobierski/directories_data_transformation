source("load_packages.R")
source("settings.R")
source("get_data.R")
library(xlsx)

firms_to_select <- c("Dentons", "Baker McKenzie", "CMS", "DLA Piper", "Clifford Chance", "Norton Rose Fulbright", "Eversheds Sutherland", "Hogan Lovells")
rankings_to_select <- c("1", "2", "Eminent Practitioner", "Ranked Individual", "Senior Statespeople", "Star Associate", "Star Individual", "Leading Individuals")
data <- df_historical_rankings %>% filter(is_ranking_current == 1, firm_agg %in% firms_to_select)
data[data == "Null"] <- NA
data <- data %>% filter(is.na(dentons_country) == F)
# filter(ranking_aggregated %in% rankings_to_select)

n <- 1
total <- data.frame()
firm <- data.frame()
lawyer <- data.frame()

for( n in c(0,1,2,3,4,5,10,15,20,25,30,50)){
  
  grouped_total <- data %>% group_by(firm_agg, dentons_country) %>% summarise(cnt = n()) %>% filter(cnt >n) %>% group_by(firm_agg) %>% summarise(countries_with_more_than_N_rankings = n()) %>% arrange(-countries_with_more_than_N_rankings) %>% mutate(N = n, level = "Total")
  total <- rbind(total, grouped_total)
  
  
  grouped_firm <- data %>% filter(level == "Firm level") %>% group_by(firm_agg, dentons_country) %>% summarise(cnt = n()) %>% filter(cnt >n) %>% group_by(firm_agg) %>% summarise(countries_with_more_than_N_rankings = n())  %>% arrange(-countries_with_more_than_N_rankings) %>% mutate(N = n, level = "Firm")
  firm <- rbind(firm, grouped_firm) 
  
  grouped_lawyer <- data %>% filter(level == "Individual level") %>% group_by(firm_agg, dentons_country) %>% summarise(cnt = n()) %>% filter(cnt >n) %>% group_by(firm_agg) %>% summarise(countries_with_more_than_N_rankings = n())  %>% arrange(-countries_with_more_than_N_rankings) %>% mutate(N = n, level = "Individual")
  lawyer <- rbind(lawyer, grouped_lawyer)
}
  
 df_all_ctry <- rbind(total, firm, lawyer) 
 
 df_all_ctry_max <- df_all_ctry %>% group_by(level, N) %>% summarise(max = max(countries_with_more_than_N_rankings)) %>% ungroup()
 
 
 df_all_ctry_agg <- dplyr::left_join(x = df_all_ctry, y = df_all_ctry_max, by = c("level", "N")) %>% filter(max == countries_with_more_than_N_rankings) %>% select(firm_agg, level, N, countries_with_more_than_N_rankings)
 
 
write.csv(df_all_ctry, "data/countries_summary.csv",row.names = F)
write.csv(df_all_ctry_agg, "data/countries_winners.csv",row.names = F)
 
