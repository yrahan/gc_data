# Question 2
# Using the jpeg package read in the following picture of your instructor into R 
# 
# https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 
# 
# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data?

library(jpeg)

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl,destfile="./data/instructor.jpg",method="curl")
instructor <- readJPEG("./data/instructor.jpg", native=TRUE)

str(instructor)
?quantile
quantile(instructor, probs=c(0.30, 0.80))
