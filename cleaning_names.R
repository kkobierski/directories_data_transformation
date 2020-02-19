# titles
df_data$lawyer_name <- gsub(", Ad E", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub(" Ad E", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub(" SC", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub(" QC", "", df_data$lawyer_name)


# locations
df_data$lawyer_name <- gsub("(Bengoshi)", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub("(Gaiben)", "", df_data$lawyer_name)


# practices and others
df_data$lawyer_name <- gsub("(Advertising)", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub("(Media Finance)", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub("(New)", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub("(non contentious)", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub("(noncontentious)", "", df_data$lawyer_name)
# df_data$lawyer_name <- gsub("", "", df_data$lawyer_name)


# juniors
df_data$lawyer_name <- gsub(", Jr", "Jr", df_data$lawyer_name)
df_data$lawyer_name <- gsub(",Jr", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub("(Jr.)", "Jr", df_data$lawyer_name)
df_data$lawyer_name <- gsub("(Jr)", "Jr", df_data$lawyer_name)
df_data$lawyer_name <- gsub(",(Jr.)", "Jr", df_data$lawyer_name)
df_data$lawyer_name <- gsub(",(Jr)", "Jr", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Jr.", "Jr", df_data$lawyer_name)
df_data$lawyer_name <- gsub("", "", df_data$lawyer_name)

# Dentons lawyers specific


#final trim
df_data$lawyer_name <- trimws(df_data$lawyer_name, "both")
