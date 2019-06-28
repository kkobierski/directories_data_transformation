
# create backup -----------------------------------------------------------
insert_to_backup <- "insert into directories.directories_backup select * from directories.directories;"
truncate_backup <- "truncate directories.directories_backup"

truncate_main <- "truncate directories.directories"

RMySQL::dbSendQuery(conn, truncate_backup)
RMySQL::dbSendQuery(conn, insert_to_backup)
RMySQL::dbSendQuery(conn, truncate_main)

# update main table -------------------------------------------------------

RMySQL::dbWriteTable(
  conn = conn,
  value = df_data_to_upload,
  name = "directories",
  append = T,
  overwrite = F,
  row.names = F,
  field.types = fields_types_directories_mysql
) 

