library(XML)

# create directory to store data
# dataDirName <- "data"
# if (!file.exists(dataDirName)){dir.create(dataDirName)}

fileURL <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileURL, useInternal=TRUE)
rootNode <- xmlRoot(doc)

xmlName(rootNode)
names(rootNode)

rootNode[[1]]
rootNode[[1]][[1]]

xmlValue(rootNode[[1]])
xmlValue(rootNode[[1]][[1]])

xmlSApply(rootNode, xmlValue)

xpathSApply(rootNode, "//name", xmlValue)
xpathSApply(rootNode, "//price", xmlValue)