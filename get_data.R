
# get historical data -----------------------------------------------------

conn <-
  RMySQL::dbConnect(
    drv = MySQL(),
    username = db_usr,
    password = db_pwd,
    host = db_address,
    dbname = db_name,
    port = 3306
  )

get_historical_data <- 'Select * from directories.directories;'
result <- RMySQL::dbSendQuery(conn, get_historical_data)
df_historical_rankings <- RMySQL::fetch(result, n = -1)
 

# get current rankings ----------------------------------------------------


# get dictionaries --------------------------------------------------------
file_path_practice <- "./data/dictionaries/practice_dictionary_final_mac.csv"
file_path_regions <- "./data/dictionaries/regions_dict.csv"

df_practice_dict <- unique(read.csv(file_path_practice, stringsAsFactors = F, sep = ";"))
df_regions_dict <- unique(read.csv(file_path_regions, stringsAsFactors = F, sep = ";"))
