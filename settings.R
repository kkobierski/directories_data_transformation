
# run script for ----------------------------------------------------------

choose_publisher <- function(publisher){
  if(publisher == "c"){
    source("get_chambers.R")
    source("correct_chambers_columns.R")
  } else if(publisher == "l"){
    source("get_legal500.R")
    source("correct_legal_columns.R")
  } else{
    stop("Incorrect publisher fool!")
  }
}

#publisher <- "Legal 500"
publisher <- "Chambers and Partners"

# db creds ----------------------------------------------------------------
pwd <- read.csv("~/Documents/projects/pwd/pwd.txt", header = F, stringsAsFactors = F)
db_usr <- pwd[[1]][1]
db_pwd <- pwd[[1]][2]
db_address <- pwd[[1]][3]
db_name <- pwd[[1]][4]

conn <-
  RMySQL::dbConnect(
    drv = MySQL(),
    username = db_usr,
    password = db_pwd,
    host = db_address,
    dbname = db_name,
    port = 3306
  )

# constants ---------------------------------------------------------------

firms_list_dentons <-
  c(
    "Dentons",
    "Dentons US LLP",
    "Dentons Canada LLP",
    'Balcıoğlu Selçuk Akman Keki',
    'Balcioglu Selcuk Akman Keki',
    # "Corpus Legal Practitioners",
    "Dacheng Law Offices, LLP" ,
    'Rodyk & Davidson LLP',
    # "Hadj-Hamou/Djouadi",
    # "JLD & MB Legal Consultancy",
    # 'MC&A',
    # "Tumi Law Firm",
    "Vella Pugliese Buosi e Guidoni Advogados",
    "Maclay Murray & Spens LLP",
    "Gallo Barrios Pickmann Abogados",
    "Dentons Peru",
    "Vella Pugliese Buosi e Guidoni Advogados",
    "McKenna Long & Aldridge LLP",
    "Dentons Cardenas & Cardenas",
    "Zain & Co",
    "Hanafiah, Ponggawa & Partners",
    "Hanafiah Ponggawa & Partners",
    "Hanafiah Ponggawa - Partners",
    "Larrain, Rencoret & Urzua",
    "Hamilton Harrison & Mathews",
    "Mardemootoo Solicitors and Balgobin Chambers",
    "Balgobin Chambers",
    "Delany Law",
    "Dinner Martin",
    "Alston Hunt Floyd & Ing",
    # "Kampala Associated Advocates",
    "MawereSibanda",
    #newly added firms - check names in legal 500 data
    "Lee International",
    "Lee International IP & Law Group",
    "Gustavo Zacapa y Asociados, Abogados & Notarios",
    "Kensington Swan",
    "Rattagan Macchiavello Arocena",
    "Jimenez de Arechaga, Viana + Brause",
    "Jimenez de Arechaga, Viana & Brause",
    #5african firms
    "LEAD Advogados",
    "Sayarh & Menjra",
    "Sayarh & Menjra Law Firm",
    "Fernanda Lopes & Associados Advogados",
    "Kyagaba and Otatiina Advocates",
    "Eric Silwamba, Jalasi and Linyama Legal Practitioners",
    "Fisher Jeffries",
    "Bingham Greenbaum and Cohen & Grigsby"
    
  )

firms_list_competition <- c(
  "Baker McKenzie",
  "Baker McKenzie LLP",
  "Baker McKenzie llP",
  "Baker & McKenzie LLP",
  "Hadiputranto, Hadinoto & Partners, a member firm of Baker & McKenzie",
  "Baker & McKenzie. Wong & Leow",
  "Estudio Echecopar member firm of Baker & McKenzie International",
  "DLA Piper LLP (US)",
  "DLA Piper LLP",
  "DLA Piper New Zealand",
  "DLA Nordic",
  "DLA Piper Pizarro, Botto & Escobar",
  "DLA",
  "DLA Piper Luxembourg",
  "DLA Piper Martinez Beltran",
  "DLA Piper UK LLP",
  "Hogan Lovells US LLP",
  "Hogan lovells US llP",
  "Hogan Lovells LLP",
  "Hogan Lovells International LLP",
  # CMS contains 40 firm names and will be resolved with like
  "CMS",
  "Clifford Chance LLP" ,
  "Clifford Chance llP",
  "Linda Widyati & Partners in association with Clifford Chance",
  "Al-Jadaan & Partners Law Firm in co-operation with Clifford Chance LLP",
  "Al-Jadaan & Partners Law Firm in \nco-operation with Clifford Chance LLP",
  "Clifford Chance",
  "Eversheds Sutherland",
  "Eversheds Sutherland LLP",
  "Norton Rose Fulbright",
  "Susandarini & Partners in association with Norton Rose Fulbright Australia",
  "Mohammed Al-Ghamdi Law Firm in association with Norton Rose Fulbright US LLP"
)

year_published_dict <- c(
  'Chambers UK',
  'Chambers Latin America',
  'Chambers Asia',
  'Chambers Asia Pacific',
  'Chambers FinTech',
  'Chambers Canada',
  'Legal 500 Canada',
  'Legal 500 Asia',
  'Legal 500 UK'
)

columns_list_csv <- c(
  
  "Year",
  "Year published",
  "Publisher",
  "Guide",
  "Level",
  "Firm name",
  "Lawyer name",
  "Is part of Dentons",
  "Ranking",
  "Ranking aggregated",
  "Directory practice",
  "Dentons practice",
  "Multipractice",
  "Dentons sector",
  "Directory region",
  "Dentons region",
  "Dentons subregion",
  "Dentons country",
  "Dentons state",
  "Dentons city",
  "guide_agg",
  "max_year",
  "Is ranking current",
  "Firm agg",
  "Special ranking",
  "Is top ranking"
)

fields_types_directories_mysql <- list(
  "year int(4),
  year_published int(4),
  publisher varchar(32),
  guide varchar(32),
  level varchar(32),
  firm_name varchar(128),
  lawyer_name varchar(255),
  is_part_of_dentons int(1),
  ranking varchar(32),
  ranking_aggregated varchar(32),
  directory_practice varchar (255),
  dentons_practice varchar(255),
  multipractice varchar(255),
  dentons_sector varchar(255),
  directory_region varchar(128),
  dentons_region varchar(16),
  dentons_subregion varchar(64),
  dentons_country varchar(64),
  dentons_state varchar(64),
  dentons_city varchar(64),
  guide_agg varchar(32),
  max_year int(4),
  is_ranking_current int(1),
  firm_agg varchar(32),
  special_ranking varchar(32),
  is_top_ranking int(1)
  ")

top_rankings_list <-
  c(
    "1",
    "2",
    "Eminent Practitioner",
    "Eminent practitioner",
    "Eminent Practitioners",
    "Eminent practitioners",
    "Ranked Individual",
    "Ranked individual",
    "Senior Statespeople",
    "Star Associate",
    "Star Associates",
    "Star Individual",
    "Star Individuals",
    "Leading Individuals",
    "Leading individuals",
    "Leading Individual",
    "Leading individual",
    "Next generation lawyers",
    "Next Generation Lawyers",
    "Next Generation Partners",
    "Next generation partners",
    "Hall of fame",
    "Hall of Fame"
    
  )

# fixed var ---------------------------------------------------------------

year_sys <- year(Sys.Date())
publisher_chambers <- "Chambers and Partners"
guide_chambers <- "Chambers"


# functions ---------------------------------------------------------------

right <- function(x, n){
  substr(x, nchar(x)-n+1, nchar(x))
}


simpleText <- function(string){
  string <- tolower(string)
  substring(string,1,1) <- toupper(substring(string,1,1))
  return(string)
}
