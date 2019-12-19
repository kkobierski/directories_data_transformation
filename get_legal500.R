file_name <- "uk_2019_indiv"
file_path <- sprintf("./data/rankings/%s.csv", file_name)

df_legal_raw <- read.csv(file_path, stringsAsFactors = F, sep = ";")


colnames(df_legal_raw) <- tolower(colnames(df_legal_raw))
colnames(df_legal_raw) <- gsub("\\.","_", colnames(df_legal_raw))
