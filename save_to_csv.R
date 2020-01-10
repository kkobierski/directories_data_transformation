df_data[df_data == "nan"] <- NA
df_data[df_data == "Null"] <- NA
df_to_save <- df_data
colnames(df_to_save) <- columns_list_csv

write.table(df_to_save, "C:/Users/kobiersk/Documents/Directories/df_final_firm.csv", sep = ';', row.names = F, na = "Null")
