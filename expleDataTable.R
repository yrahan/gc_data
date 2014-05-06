library(data.table)

# data frame
DF = data.frame(x=rnorm(9), y=rep(c("a", "b", "c"), each=3), z=rnorm(9))
head(DF, 3)

# data table
DT = data.table(x=rnorm(9), y=rep(c("a", "b", "c"), each=3), z=rnorm(9))
head(DT, 3)

# list tables
tables()

# subseting

DF[2, ]
DT[DT$y == "a"]

DT[c(2, 3)]
# here diverges from data.frame
DT[, list(mean(x), mean(z))]
DT[, table(y)]

# add new column
DT[, w:=z^2]

# careful with copies
DT2 <- DT
DT[, y:=2]  # changes DT2 too
# apply a serie of statements (expression)
DT[, m:={tmp <- (x + z); log2(tmp + 5)}]

DT[, a:=x>0]
DT[, b:=mean(x+w), by=a]  # agregation by a (here two values, when a= TRUE and a=FALSE)

# other example, use of .N
set.seed(123)
DT = data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x] 

# use of a key
DT = data.table(x=rep(c("a", "b", "c"), each=100), y=rnorm(300))
setkey(DT, x)
DT['a']

# merge of data tables (join)
DT1 = data.table(x=c("a", "a", "b", "dt1"), y=1:4)
DT2 = data.table(x=c("a", "b", "dt2"), z=(5:7))
setkey(DT1, x)
setkey(DT2, x)
merge(DT1, DT2)