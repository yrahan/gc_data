# Working with dates

d1 = date()
d1
class(d1)
d2 = Sys.Date()
d2
class(d2)

# formatting dates
format(d2,"%a %b %d")
x = c("1jan1960", "2jan1960", "31mar1960", "30jul1960"); z = as.Date(x, "%d%b%Y")
z
z[1] - z[2]
as.numeric(z[1]-z[2])
weekdays(d2)
months(d2)
# Converting to Julian
julian(d2)
