# Reshaping data

library(reshape2)
head(mtcars)

# Melting data frames

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)

# Casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData

?dcast
cylData <- dcast(carMelt, cyl ~ variable,mean)
cylData

# Averaging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)

# another way - split
spIns =  split(InsectSprays$count,InsectSprays$spray)
spIns
# another way - apply
sprCount = lapply(spIns,sum)
sprCount
# another way - combine
unlist(sprCount)

# another way - plyr package
ddply(InsectSprays,.(spray),summarize,sum=sum(count))


# creating a new variable
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)
