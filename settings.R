
# db creds ----------------------------------------------------------------
pwd <- read.csv("~/Documents/projects/pwd/pwd.txt", header = F, stringsAsFactors = F)
db_usr <- pwd[[1]][1]
db_pwd <- pwd[[1]][2]
db_address <- pwd[[1]][3]
db_name <- pwd[[1]][4]
