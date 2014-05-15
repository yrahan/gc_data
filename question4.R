library(XML)

# create directory to store data
# dataDirName <- "data"
# if (!file.exists(dataDirName)){dir.create(dataDirName)}

fileUrl <- "http://biostat.jhsph.edu/~jleek/contact.html"

connection <- url(fileUrl)
htmlCode <- readLines(connection)

head(htmlCode)
htmlCode[1]

sapply(htmlCode[c(10, 20, 30, 100)], nchar)
