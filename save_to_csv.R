df_data[df_data == "nan"] <- NA
df_to_save <- df_data
colnames(df_to_save) <- columns_list_csv

write.table(df_to_save, "~/Documents/projects/R/directories_data_cleaning/data_to_share/df_final_firm.csv", sep = ';', row.names = F, na = "Null")