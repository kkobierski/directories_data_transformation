
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
    "Corpus Legal Practitioners",
    "Dacheng Law Offices, LLP" ,
    'Rodyk & Davidson LLP',
    "Hadj-Hamou/Djouadi",
    "JLD & MB Legal Consultancy",
    'MC&A',
    "Tumi Law Firm",
    "Vella Pugliese Buosi e Guidoni Advogados",
    "Maclay Murray & Spens LLP",
    "Gallo Barrios Pickmann Abogados",
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
    "Kampala Associated Advocates"
    
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

year_publisged_dict <- c(
  'Chambers UK',
  'Chambers Latin America',
  'Chambers Asia',
  'Chambers FinTech',
  'Chambers Canada',
  'Legal 500 Canada',
  'Legal 500 Asia'
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
  "Firm agg"
)
