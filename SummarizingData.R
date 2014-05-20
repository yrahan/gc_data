# Summarizing data

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv",method="curl")
restData <- read.csv("./data/restaurants.csv")

head(restData, n=3)

names(restData)

tail(restData, n=3)
summary(restData)

str(restData)

# Quantiles of quantitative variables
quantile(restData$councilDistrict,na.rm=TRUE)
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))
# Make table
table(restData$zipCode,useNA="ifany")
table(restData$councilDistrict,restData$zipCode)

# Check for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

# Rows and columns sum
colSums(is.na(restData))
all(colSums(is.na(restData))==0)

# Values with specific caracteristiques
table(restData$zipCode %in% c("21212"))

table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),]


# cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit,data=DF)
xt


# flat tables
rep(1:9, len = 54)
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~.,data=warpbreaks)
xt

ftable(xt)

# size of dataset
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")
