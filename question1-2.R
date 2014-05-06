# Question 1

# create directory to store data
dataDirName <- "data"
if (!file.exists(dataDirName)){dir.create(dataDirName)}

# download data
dataFilePath <- paste(".", dataDirName, "cameras.csv", sep="/")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile=dataFilePath, method="curl")

# The code book, describing the variable names is here: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

# read downloaded file
mydata <- read.table(dataFilePath, header=TRUE, sep=",")
# select house units (cf pdf)
nrow(subset(x = mydata, subset = TYPE == 1 & VAL == 24, select = c(TYPE,VAL)))

# Question 2
table(mydata$FES)