library(XML)

# create directory to store data
# dataDirName <- "data"
# if (!file.exists(dataDirName)){dir.create(dataDirName)}

fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileURL, useInternal=TRUE)
rootNode <- xmlRoot(doc)

xmlName(rootNode)
names(rootNode)

zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
(table(zipcodes))[["21231"]]