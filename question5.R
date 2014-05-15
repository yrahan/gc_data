fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for "
download.file(fileUrl, destfile="data.for", method="curl")

#acs = read.table(file="data.for", header=FALSE, sep="", skip=5)
records <- read.fwf("data.for",
                    widths=c(15,4,4,-5,4,4,-5,4,4,-5,4,4),
                    col.names=c("Week", "SST", "SSTA", "SST.1", "SSTA.1",
                                "SST.2", "SSTA.2", "SST.3", "SSTA.3")
                    ,skip=4
                    )

sum(as.numeric(records$SST.1))
