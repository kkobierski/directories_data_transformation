source("load_packages.R")
publisher <- "Legal 500"
tic()
source("settings.R")
source("get_data.R")

if(publisher == "Chambers and Partners"){
  source("get_chambers.R")
  source("correct_chambers_columns.R")
} else if(publisher == "Legal 500"){
  source("get_legal500.R")
  source("correct_legal_columns.R")
} else{
  print("Incorrect publisher fool!")
}

source("match_practices.R")
source("match_regions.R")
source("add_extra_columns.R")
source("add_historical_rankings.R")
source("save_to_csv.R")
toc()