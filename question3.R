library(xlsx)

# create directory to store data
dataDirName <- "data"
if (!file.exists(dataDirName)){dir.create(dataDirName)}

# download data
dataFilePath <- paste(".", dataDirName, "mydata.xlsx", sep="/")
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile=dataFilePath, method="curl")
#
# read downloaded file
#mydata <- read.xlsx(dataFilePath, sheetIndex=1, header=FALSE)

# example of reading only a subset
colIndex <- 18:23
rowIndex <- 7:15
read.xlsx(dataFilePath, sheetIndex=1, header=TRUE,
                 colIndex=colIndex, rowIndex=rowIndex, stringsAsFactors=FALSE)
#sum(dat$Zip*dat$Ext,na.rm=T) 