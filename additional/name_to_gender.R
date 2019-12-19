source("load_packages.R")
source("settings.R")
source("get_data.R")


df_names <- df_historical_rankings %>% filter(level == "Individual level") %>% select(lawyer_name) %>% group_by(trimws(lawyer_name, c('both'))) %>% summarise()

setnames(df_names, colnames(df_names), 'name')

df_names$first_name <- gsub(" .*", "", df_names$name)
df_names$first_name <- tolower(df_names$first_name)
df_names_agg <- df_names %>% group_by(first_name) %>% summarise() %>% mutate(n = nchar(first_name)) %>% filter(n>1) 

write.csv(df_names_agg, "~/Documents/projects/Python/names_gender/lawyer_names.csv", row.names = F)
