library(sqldf)


fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile="data.csv", method="curl")

acs = read.table(file="data.csv", header=TRUE, sep=",")
sqldf("select pwgtp1 from acs where AGEP < 50")


unique(acs$AGEP)
?unique

sqldf("select distinct AGEP from acs")
