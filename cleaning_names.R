# titles
df_data$lawyer_name <- gsub(", Ad E", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub(" Ad E", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub(", SC", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub(" SC", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub(", QC", "", df_data$lawyer_name)
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


# Dentons lawyers specific
df_data$lawyer_name <- gsub("Adam M Mycyk", "Adam Mycyk", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Arek Krasnodebski", "Arkadiusz Krasnodebski", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Babette Marzheuser.*", "Babette Marzheuser-Wood", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Carmen Sanabria.*", "Carmen Sanabria Gomez", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Christopher McGeeOsborne", "Christopher McGee-Osborne", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Gabriel R Macchiavello", "Gabriel Macchiavello", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Giangiacommo Olivi", "Giangiacomo Olivi", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Gordon.*Tarnowsky", "Gordon L Tarnowsky", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Juanita Acosta", "Juanita Acosta Gomez", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Kenneth.*Fraser", "Kenneth Fraser", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Luz Helena Adarve", "Luz Helena Adarve Gomez", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Martin.*Fanning", "Martin Fanning", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Martine Gerber.*emaire", "Martine Gerber-Lemaire", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Matthew Hanslip.*Ward", "Matthew Hanslip Ward", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Paul.*Lalonde", "Paul M  Lalonde", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Rogelio Lopez.*Velarde", "Rogelio Lopez Velarde", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Alex.*MacWilliam", "Alex MacWilliam", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Amanda Jones", "Amanda C Jones", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Anna Pukszto", "Anna Maria Pukszto", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Bernardo Cardenas", "Bernardo P Cardenas Martinez", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Evan.*Lazar", "Evan Z Lazar", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Gabriela Gandara Ulloa", "Gabriela Gandara", df_data$lawyer_name)
df_data$lawyer_name <- gsub("James.*Hogan", "James E Hogan", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Sivakumaren Mardemootoo", "Robin Mardemootoo", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Takura Kawaii", "Takura Kawai", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Y Monica Song", "Monica Song", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Nancy.*Sun", "Nancy Sun", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Lim I.*An", "I-An Lim", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Lee Ai Ming", "Ai Ming Lee", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Ng Eng Leng", "Eng Leng Ng", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Diego.*Viana", "Diego Viana", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Chea Shin Leeh", "Lee Chea Shinh", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Liz Tout", "Elizabeth Tout", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Michael.*Barr", "Michael Barr", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Richard.*Belder", "Richard de Belder", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Tan Joo Thye", "Joo Thye Tan", df_data$lawyer_name)
# df_data$lawyer_name <- gsub("", "", df_data$lawyer_name)

# competitors specific lawyers
#Baker
df_data$lawyer_name <- gsub("Alexander.*Korobeinikov", "Alexander V Korobeinikov", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Alvaro Gutierrez", "Alvaro Gutierrez Bendezu", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Alvira.*Wahjosoedibjo", "Alvira Wahjosoedibjo", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Alejandro.*Valls", "Alejandro Valls", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Alfonso Garcia.*Lozano", "Alfonso Garcia", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Joseph.*Fu", "Joseph Fu", df_data$lawyer_name)
df_data$lawyer_name <- gsub("Chris.*Hogan", "Christopher Hogan", df_data$lawyer_name)
df_data$lawyer_name <- gsub("", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub("", "", df_data$lawyer_name)
df_data$lawyer_name <- gsub("", "", df_data$lawyer_name)

#Norton Rose Fulbright
df_data$lawyer_name <- gsub("Nic.*Grandage", "Nicholas Grandage", df_data$lawyer_name)



#final trim
df_data$lawyer_name <- trimws(df_data$lawyer_name, "both")
