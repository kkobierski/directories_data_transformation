
# get historical data -----------------------------------------------------
# get_historical_data <- 'Select * from directories.directories;'
# result <- RMySQL::dbSendQuery(conn, get_historical_data)
# df_historical_rankings <- RMySQL::fetch(result, n = -1)
# RMySQL::dbDisconnect(conn) 

df_historical_rankings <- read.table(file = "C:/Users/kobiersk/Documents/Directories/ALL rankings spreadsheet - historic and current.csv", 
                                     sep = ";",
                                     stringsAsFactors = F,
                                     header = T)

colnames(df_historical_rankings) <- tolower(colnames(df_historical_rankings))
colnames(df_historical_rankings) <- gsub("\\.", "_", colnames(df_historical_rankings))

df_historical_rankings <- 
  df_historical_rankings %>% mutate(
    is_part_of_dentons = if_else(is_part_of_dentons == "Yes", 1, 0),
    is_top_ranking = if_else(is_top_ranking  == "Yes", 1, 0),
    is_ranking_current = if_else(year == max_year, 1, 0)

  )


# get current rankings ----------------------------------------------------


# get dictionaries --------------------------------------------------------
file_path_practice <- "./data/dictionaries/practice_dictionary_final_mac.csv"
file_path_regions <- "./data/dictionaries/regions_dict.csv"
file_path_chambers_publications <-"./data/dictionaries/chambers_publications_dict.csv"
file_path_chambers_firms <-"./data/dictionaries/chambers_firms_dict.csv"

df_practice_dict <- unique(read.csv(file_path_practice, stringsAsFactors = F, sep = ","))
df_regions_dict <- unique(read.csv(file_path_regions, stringsAsFactors = F, sep = ","))
df_chambers_publications_dict <- unique(read.csv(file_path_chambers_publications, stringsAsFactors = F, sep = ";"))
df_chambers_firms_dict <- unique(read.csv(file_path_chambers_firms, stringsAsFactors = F, sep = ";"))
