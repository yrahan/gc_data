# create folder data in working directory
if (!file.exists("data")){dir.create("data")}

# download csv file about cameras from open data baltimore city website
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile='./data/camera.csv', method="curl")
list.files("./data") ## [1]  "camera.csv"

# store date 
dateDownloaded <- date()
dateDownloaded ## [2]  "Mon May  5 22:19:04 2014"
