# Question 5
library(data.table)

# create directory to store data
dataDirName <- "data"
if (!file.exists(dataDirName)){dir.create(dataDirName)}

# The American Community Survey distributes downloadable data about United States communities.
# Download the 2006 microdata survey about housing for the state of Idaho using 
# download.file() from here: 

# download data
dataFilePath <- paste(".", dataDirName, "microdata.csv", sep="/")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile=dataFilePath, method="curl")

# using the fread() command load the data into an R object
DT <- fread(dataFilePath)

# Which of the following is the fastest way to calculate the average value of the variable

tapply(DT$pwgtp15,DT$SEX,mean)
system.time(tapply(DT$pwgtp15,DT$SEX,mean))

sapply(split(DT$pwgtp15,DT$SEX),mean)
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

mean(DT$pwgtp15,by=DT$SEX)
system.time(mean(DT$pwgtp15,by=DT$SEX))

rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})

DT[,mean(pwgtp15),by=SEX]
systeme.time(DT[,mean(pwgtp15),by=SEX])

mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})