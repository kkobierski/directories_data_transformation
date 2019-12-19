source("load_packages.R")
source("settings.R")
source("get_data.R")
library(tidyr)
df_historical_rankings[df_historical_rankings == "Null"] <- NA
data <- df_historical_rankings %>% filter(is_ranking_current == 1)
firms_to_select <- c("Dentons", "Baker McKenzie", "CMS", "DLA Piper", "Clifford Chance", "Norton Rose Fulbright", "Eversheds Sutherland", "Hogan Lovells")

n <- 5

grouped_total <- data %>% group_by(firm_agg, dentons_country) %>% summarise(cnt = n()) %>% filter(cnt >n) %>% group_by(firm_agg) %>% summarise(ctry_with_more_than_5_ranings = n()) %>% arrange(-ctry_with_more_than_5_ranings)


grouped_firm <- data %>% filter(level == "Firm level") %>% group_by(firm_agg, dentons_country) %>% summarise(cnt = n()) %>% filter(cnt >n) %>% group_by(firm_agg) %>% summarise(ctry_with_more_than_5_ranings = n())  %>% arrange(-ctry_with_more_than_5_ranings)


grouped_lawyer <- data %>% filter(level == "Individual level") %>% group_by(firm_agg, dentons_country) %>% summarise(cnt = n()) %>% filter(cnt >n) %>% group_by(firm_agg) %>% summarise(ctry_with_more_than_5_ranings = n())  %>% arrange(-ctry_with_more_than_5_ranings)


grouped_total_top_a <- data_top %>% group_by(firm_agg) %>% summarise(cnt = n())

x <- data_top %>% group_by(firm_agg, dentons_region) %>% summarise(n = n())
x <- tidyr::spread(x, dentons_region, n)

x <- data_top %>% filter(level == "Individual level") %>% group_by(firm_agg, dentons_country) %>% summarise() %>% group_by(firm_agg) %>% summarise(n = n()) %>% arrange(-n)


x <- data_top %>% filter(level == "Individual level") %>% group_by(firm_agg, lawyer_name) %>% summarise(cnt = n()) %>% filter(cnt > 1) %>% group_by(firm_agg) %>% summarise(n = n()) %>% arrange(-n)

x <- data_top %>% filter(dentons_sector != "Multisector") %>%  group_by(firm_agg, dentons_sector) %>% summarise(cnt = n()) %>% filter(cnt > 1) %>% group_by(firm_agg) %>% summarise(n = n()) %>% arrange(-n)

x <- data_top %>% filter(dentons_practice != "Multipractice", level == "Individual level") %>% group_by(firm_agg, dentons_practice) %>% summarise(cnt = n()) %>% filter(cnt > 1) %>% group_by(firm_agg) %>% summarise(n = n()) %>% arrange(-n)


## Improvment in number of rankings over the years

data_long <- df_historical_rankings %>% filter(firm_agg %in% firms_to_select, year_published >= 2017)
x <- data_long %>% filter(year_published < 2019, publisher == "Legal 500") %>% group_by(year_published, firm_agg) %>% summarise(n = n()) %>% arrange(firm_agg, year_published)

x <- data.frame(tidyr::spread(x, year_published, n) )
x <- x %>% mutate(percentage_change = round(((X2018/ X2017) -1) * 100, 2)) %>% arrange(-percentage_change)


############ PRACTICE CHANGE

x <-  data_long %>% filter(year_published < 2019, level == "Individual level") %>% group_by(dentons_practice, firm_agg, year_published) %>% summarise(n = n()) %>% arrange(dentons_practice, firm_agg, year_published)

x <- data.frame(tidyr::spread(x, year_published, n)) %>% mutate(percentage_change = round(((X2018/ X2017) -1) * 100, 2)) %>% arrange(dentons_practice, - percentage_change)


############ SECTOR CHANGE

x <-  data_long %>% filter(year_published < 2019, level == "Firm level") %>% group_by(dentons_sector, firm_agg, year_published) %>% summarise(n = n()) %>% arrange(dentons_sector, firm_agg, year_published)

x <- data.frame(tidyr::spread(x, year_published, n)) %>% mutate(percentage_change = round(((X2018/ X2017) -1) * 100, 2)) %>% arrange(dentons_sector, - percentage_change)


############### country
x <-  data_long %>% filter(year_published < 2019, level == "Individual level") %>% group_by(dentons_country, firm_agg, year_published) %>% summarise(n = n()) %>% arrange(dentons_country, firm_agg, year_published)

x <- data.frame(tidyr::spread(x, year_published, n)) %>% mutate(percentage_change = round(((X2018/ X2017) -1) * 100, 2)) %>% arrange(dentons_country, - percentage_change) %>% arrange(dentons_country, -percentage_change)
x <- x %>% group_by(dentons_country) %>% mutate(highest_score = max(percentage_change)) %>% ungroup() %>% filter(is.na(highest_score) == F, highest_score == percentage_change, firm_agg == "Dentons", percentage_change >0) %>% select(-highest_score)


########## wins to total
x <-  data_long %>% filter(year_published %in% c(2017,2018), level == "Firm level") %>% mutate(is_top = if_else(ranking_aggregated %in% rankings_to_select, 1, 0)) %>% group_by(firm_agg, year_published) %>% summarise(n = n(), top = sum(is_top)) %>% mutate(ratio = round(top/n,4)*100) %>% select(firm_agg, year_published, ratio)

x <- data.frame(tidyr::spread(x, year_published, ratio)) %>% mutate(percentage_change = round(((X2018/ X2017) -1) * 100, 2)) %>% arrange( - percentage_change)


##### wins to losses

x <-  data_long %>% filter(year_published %in% c(2017,2018), level == "Individual level") %>% mutate(is_top = if_else(ranking_aggregated %in% rankings_to_select, 1, 0)) %>% group_by(firm_agg, year_published) %>% summarise(n = n(), top = sum(is_top)) %>% mutate(ratio = top/(n-top)) %>% select(firm_agg, year_published, ratio)

x <- data.frame(tidyr::spread(x, year_published, ratio)) %>% mutate(percentage_change = round(((X2018/ X2017) -1) * 100, 2)) %>% arrange( - percentage_change)


#### percentage changes Y2Y

data_t <- df_historical_rankings %>% filter(year_published %in% c(2015, 2016, 2017, 2018), firm_agg %in% firms_to_select) %>% group_by(year_published, firm_agg) %>% summarise(n = n()) 

data_t <- data.frame(tidyr::spread(data_t, year_published, n))
data_t <- data_t %>% mutate(`18-15` = (X2018/X2017) - 1,
                            `18-16` = (X2018/X2016) - 1,
                            `18-17` = (X2018/X2017) - 1
                            )


#### Countries where Dentons has rankings while competitors don't

ctry <- data %>% filter(firm_agg %in% firms_to_select, is.na(dentons_country)==F) %>% group_by(firm_agg, dentons_country) %>% summarise(n=n())
ctry <- tidyr::spread(ctry, firm_agg, n)
ctry <- ctry %>% filter(is.na(Dentons) == F,
                        is.na(`Baker McKenzie`),
                        is.na(`Clifford Chance`),
                        is.na(CMS),
                        is.na(`Eversheds Sutherland`),
                        is.na(`Hogan Lovells`),
                        is.na(`DLA Piper`),
                        is.na(`Norton Rose Fulbright`)) %>% select(dentons_country, Dentons) %>% arrange(-Dentons)
setnames(ctry, colnames(ctry), c("Country", "N"))


