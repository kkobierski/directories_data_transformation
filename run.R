source("load_packages.R")

tic()
source("settings.R")
source("get_data.R")

choose_publisher("c")

source("match_practices.R")
source("match_regions.R")
source("add_extra_columns.R")
source("add_historical_rankings.R")
source("save_to_csv.R")
toc()
