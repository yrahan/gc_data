library(XML)

# create directory to store data
# dataDirName <- "data"
# if (!file.exists(dataDirName)){dir.create(dataDirName)}

fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl, useInternal=TRUE)

scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)

scores
teams