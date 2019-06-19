
# get historical data -----------------------------------------------------
get_historical_data <- 'Select * from directories.directories;'
result <- RMySQL::dbSendQuery(conn, get_historical_data)
df_historical_rankings <- RMySQL::fetch(result, n = -1)
 

# get current rankings ----------------------------------------------------


# get dictionaries --------------------------------------------------------
file_path_practice <- "./data/dictionaries/practice_dictionary_final_mac.csv"
file_path_regions <- "./data/dictionaries/regions_dict.csv"
file_path_chambers_publications <-"./data/dictionaries/chambers_publications_dict.csv"

df_practice_dict <- unique(read.csv(file_path_practice, stringsAsFactors = F, sep = ";"))
df_regions_dict <- unique(read.csv(file_path_regions, stringsAsFactors = F, sep = ";"))
df_chambers_publications_dict <- unique(read.csv(file_path_chambers_publications, stringsAsFactors = F, sep = ","))
