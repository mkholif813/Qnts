library(tidyverse)
library(ggplot2)
library(dplyr)
library(psych)

library(readxl)
QntAftrCVD <- read_excel("QntAftrCVD.xlsx")
QntAftrCVD
head(QntAftrCVD)



# Creating an "X" viariable
x= QntAftrCVD$Nts

ggplot(data = QntAftrCVD, mapping = aes(x = TotalSale)) +
  geom_histogram(fill = "steelblue2", color = "black", binwidth = 1000) +
  labs(x = "Sales Price (in $)")

#t test of x against a null hypothesis 
# that population mean (mu) is 0.20
t.test(x, mu = )



