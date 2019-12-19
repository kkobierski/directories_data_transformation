source("load_packages.R")
source("settings.R")
source("get_data.R")
library(xlsx)

firms_to_select <- c("Dentons", "Baker McKenzie", "CMS", "DLA Piper", "Clifford Chance", "Norton Rose Fulbright", "Eversheds Sutherland", "Hogan Lovells")
rankings_to_select <- c("1", "2", "Eminent Practitioner", "Ranked Individual", "Senior Statespeople", "Star Associate", "Star Individual", "Leading Individuals")
data <- df_historical_rankings %>% filter(is_ranking_current == 1, firm_agg %in% firms_to_select)

guides_list <- data %>% group_by(guide_agg) %>% summarise() %>% pull(guide_agg)

n <- 1
total <- data.frame()
firm <- data.frame()
lawyer <- data.frame()

for(guide in guides_list){
  guides_t <- data %>% filter(guide_agg == "Chambers Global",) %>% group_by(guide_agg, year_published, firm_agg)
  
  
}


