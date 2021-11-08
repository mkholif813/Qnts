

library(readxl)
QntsAftCovid <- read_excel("quintessdata.xlsx", 
                           sheet = "AfterExtendingContracts", col_types = c("numeric", 
                                                                            "numeric", "text", "text", "numeric", 
                                                                            "numeric", "date", "date", "date", 
                                                                            "numeric", "numeric", "text"))

QntsAftCovid <- QntsAftCovid %>% select(c(3,7,8,9,10,11,12))

QntsAftCovid

QntsAftCovid <- QntsAftCovid %>% filter(str_detect(DestName, "San Diego") | str_detect(DestName, "Wine Country") 
                                          | str_detect(DestName, "Orlando") | str_detect(DestName, "Costa Rica") 
                                          | str_detect(DestName, "Charleston"))
QntsAftCovid
