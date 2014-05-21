# Question 1
# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file()
# from here: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
# 
# and load the data into R. The code book, describing the variable names is here: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
# 
# Create a logical vector that identifies the households on greater than 10 acres who sold more 
# than $10,000 worth of agriculture products. Assign that logical vector to the variable 
# agricultureLogical. Apply the which() function like this to identify the rows of the data frame 
# where the logical vector is TRUE. which(agricultureLogical) What are the first 3 values that result?

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="./data/communities.csv",method="curl")
communities <- read.csv("./data/communities.csv")

# Create a logical vector that identifies 
# the households on greater than 10 acres 
# who sold more than $10,000 worth of agriculture products. 
# Assign that logical vector to the variable agricultureLogical. 
# Apply the which() function like this to identify the rows of the data frame 
# where the logical vector is TRUE. which(agricultureLogical) 
# What are the first 3 values that result?

str(communities)
table(communities$ACR)
## 3 .House on ten or more acres
table(communities$AGS)
## 6 .$10000+
class(communities$ACR)
class(communities$AGS)

agricultureLogical <- (communities$ACR == 3 & communities$AGS == 6)
dim(communities[which(agricultureLogical),])
head(communities[which(agricultureLogical),], n=3)
