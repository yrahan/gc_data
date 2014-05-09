library(xlsx)

# create directory to store data
dataDirName <- "data"
if (!file.exists(dataDirName)){dir.create(dataDirName)}

# download data
dataFilePath <- paste(".", dataDirName, "mydata.xlsx", sep="/")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile=dataFilePath, method="curl", mode="wb")

# read downloaded file
mydata <- read.xlsx(dataFilePath, sheetIndex=1, header=FALSE)

# # example of reading only a subset
# colIndex <- 18:23
# rowIndex <- 7:15
# dat <- read.xlsx(dataFilePath, sheetIndex=1, header=FALSE, 
#                          colIndex=colIndex, rowIndex=rowIndex)