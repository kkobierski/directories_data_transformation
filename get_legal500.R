file_name <- "legal500_AP2020"
file_path <- sprintf("C:/Users/kobiersk/Documents/Directories/Legal 500/%s.csv", file_name)

df_legal_raw <- read.csv(file_path, stringsAsFactors = F, sep = ",")


colnames(df_legal_raw) <- tolower(colnames(df_legal_raw))
colnames(df_legal_raw) <- gsub("\\.","_", colnames(df_legal_raw))
colnames(df_legal_raw) <- gsub(".*country", "country", colnames(df_legal_raw))
