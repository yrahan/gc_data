# Question 3
# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
# 
# Load the educational data from this data set: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
# 
# Match the data based on the country shortcode. How many of the IDs match? 
# Sort the data frame in descending order by GDP rank. 
# What is the 13th country in the resulting data frame? 
# 
# Original data sources: 
#   http://data.worldbank.org/data-catalog/GDP-ranking-table 
# http://data.worldbank.org/data-catalog/ed-stats

if(!file.exists("./data")){dir.create("./data")}
# Gross Domestic Product
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
download.file(fileUrl,destfile="./data/gdp.csv",method="curl")
gdp <- read.csv("./data/gdp.csv")
# educational data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl,destfile="./data/educational.csv",method="curl")
educational <- read.csv("./data/educational.csv")


names(educational)
unique(educational$CountryCode)
head(gdp)
names(gdp)
gdp <- gdp[gdp$X != "",]
unique(gdp$X)
# cleaning
gdp<-gdp[5:194,]
# merging

mergedData = merge(gdp,educational,by.x="X",by.y="CountryCode")
mergedData$Gross.domestic.product.2012 = as.integer(
  as.character(
    mergedData$Gross.domestic.product.2012))
sum(!is.na(unique(mergedData$Gross.domestic.product.2012)))
head(gdp)
