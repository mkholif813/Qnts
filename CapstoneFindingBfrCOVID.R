# Required Libraries
library(tidyverse)
library(ggplot2)
library(dplyr)
library(psych)
library(readxl)


## Uploading the datasets

QntsBfrCovid <- read_excel("/Volumes/External HD/CSU/MIS-581 Capstone/Module 6/quintessdata.xlsx", 
                                 sheet = "CoupleYearsbeforeCovid", col_types = c("numeric", 
 "numeric", "text", "text", "numeric",  "numeric", "date", "date", "date", "numeric", "numeric", "text"))
                                                                                
                                                                                 
QntsBfrCovid


## Selelcting the targeted destination 

QntsBfrCovid <- QntsBfrCovid %>% filter(str_detect(DestName, "San Diego") | str_detect(DestName, "Wine Country") 
                                         | str_detect(DestName, "Orlando") | str_detect(DestName, "Costa Rica") 
                                         | str_detect(DestName, "Charleston"))
QntsBfrCovid

QntsBfrCovid <- QntsBfrCovid %>% select(c(3,7,8,9,10,11,12))

dim(QntsBfrCovid)
str(QntsBfrCovid)
## mean summary for dataset grouped by DestName to the nights booked.

QntsBfrCovid %>% group_by(DestName) %>% summarise(mean(Nts))

QntsBfrCovid %>% group_by(DestName) %>% summarise(number = length(Nts), avg.nts = mean(Nts))

## mean summary for dataset grouped by DestName to the TotalSales.

QntsBfrCovid %>% group_by(DestName) %>% summarise(mean(TotalSale))

QntsBfrCovid %>% group_by(DestName) %>% summarise(number = length(TotalSale), avg.totsales = mean(TotalSale))

## mean summary for dataset grouped by Channels to the TotalSales
QntsBfrCovid %>% group_by(Channels) %>% summarise(number = length(TotalSale), avg.totsales = mean(TotalSale))

## mean summary for dataset grouped by Channels & DestName to the Nts

 QntsBfrCovid  %>%  group_by(DestName, Channels) %>% summarise(avg.nts = mean(Nts))

 ## mean summary for dataset grouped by Channels & DestName to the TotalSales
 QntsBfrCovid  %>%  group_by(DestName, Channels) %>% summarise(avg.totsales = mean(TotalSale))

## More organized
 
 QntsBfrCovid  %>%  group_by(DestName, Channels) %>% summarise(avg.totsales = mean(TotalSale)) %>% spread(Channels, avg.totsales)
 
 
 
ggplot(data = QntsBfrCovid, mapping = aes(x = TotalSale)) +
  geom_histogram(fill = "steelblue2", color = "black", binwidth = 1000) +
  labs(x = "Sales Price (in $)")

