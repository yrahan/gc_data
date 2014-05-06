# create directory to store data
dataDirName <- "data"
if (!file.exists(dataDirName)){dir.create(dataDirName)}

# download data
dataFilePath <- paste(".", dataDirName, "cameras.csv", sep="/")
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile=dataFilePath, method="curl")

# date of download
downloadedDate <-date()
downloadedDate
# [1] "Tue May  6 10:43:51 2014"

# read downloaded file
cameraData <- read.table(dataFilePath, header=TRUE, sep=",")


