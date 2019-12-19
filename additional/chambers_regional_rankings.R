source("load_packages.R")

tic()
source("settings.R")
source("get_data.R")

choose_publisher("c")

source("match_practices.R")
source("match_regions.R")
source("add_extra_columns.R")
df_historical_rankings <- df_historical_rankings[0,]
source("add_historical_rankings.R")


df_data[df_data == "nan"] <- NA
df_data[df_data == "Null"] <- NA
df_to_save <- df_data

colnames(df_to_save) <- columns_list_csv

guide_to_save <- gsub(" ", "_", tolower(df_data$guide[1]))

file_name <-
  sprintf(
    "~/Documents/dentons/rankings/chambers_regional/regional_rankings_%s.csv",
    guide_to_save
  )

write.table(
  df_to_save,
  file_name,
  sep = ';',
  row.names = F,
  na = "Null"
)
