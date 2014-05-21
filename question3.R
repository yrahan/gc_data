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
gdp <- read.csv("./data/gdp.csv", header=FALSE, stringsAsFactors=FALSE)
# educational data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl,destfile="./data/educational.csv",method="curl")
educational <- read.csv("./data/educational.csv")


names(educational)
head(educational)
head(gdp)
tail(gdp)
names(gdp)
unique(educational$CountryCode)
head(gdp)


# cleaning
gdp<-gdp[6:195,]
names(gdp)[1] <- "CountryCode"
names(gdp)[2] <- "Ranking"
names(gdp)[5] <- "Gross.domestic.product.2012"

# merging

mergedData = merge(gdp,educational,by="CountryCode")
class(mergedData$Gross.domestic.product.2012)
# remove comma of thousands before converting characters to numeric
mergedData$Gross.domestic.product.2012 = as.numeric(
  gsub(",","", mergedData$Gross.domestic.product.2012))
  
sum(!is.na(unique(mergedData$CountryCode)))
mergedData$Ranking <- as.numeric(mergedData$Ranking)
orderedData <- mergedData[order(mergedData$Ranking),]

orderedData$Long.Name[[13]]
