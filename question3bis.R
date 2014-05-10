library(xlsx)

# download data

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile="mydata.xlsx", method="curl")

# read only a subset
# colIndex <- 18:23
# rowIndex <- 7:15
colIndex <- 11:15
rowIndex <- 2:5
dat <- read.xlsx("mydata.xlsx", sheetIndex=1, header=FALSE,
                 colIndex=colIndex, rowIndex=rowIndex, stringsAsFactors=FALSE)
# compute
#sum(dat$Zip*dat$Ext,na.rm=T) 