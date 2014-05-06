library(jsonlite)

# create directory to store data
# dataDirName <- "data"
# if (!file.exists(dataDirName)){dir.create(dataDirName)}

fileUrl <- "https://api.github.com/users/yrahan/repos"
jsondata <- fromJSON(fileUrl)

names(jsondata)
class(jsondata)
names(jsondata$owner)
class(jsondata$owner)
jsondata$owner$login

# the login for the different repos
class(jsondata$owner$login)
# all yrahan, caause all are mine


## example data.frame to json
myjson <- toJSON(iris, pretty=TRUE)
cat(myjson)

## example json to dataframe
iris2 <- fromJSON(myjson)
head(iris2)