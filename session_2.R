setwd("D:\\GDM\\session1\\data")


library(raster)
library(rgdal)

getwd()
dir()

elevationData <- raster("kiambu_elevation.tif")
summary(elevationData)
str(elevationData)

elevatioDataFrame <- as.data.frame(elevationData)
elevatioDataFrame <- na.omit(elevationData)
View(elevationData)

sampleData <- sampleRandom(
  elevationData, size = 1000,
  cell = TRUE,
  sp = TRUE
  )
head(sampleData)

plot(elevationData, main = "Kiambu Elevation")
plot(sampleData, add = TRUE, pch = 20, cex = 0.1)

# read coordinates
sampleDataCoordinates <- sampleData@coords
View(sampleDataCoordinates)

# reading attributes
sampleDataAtt <- sampleData@data
View(sampleDataAtt)

# subsetting

data <- cbind(sampleDataCoordinates, sampleDataAtt)
View(data)

colnames(data)
data <- data[, c("x", "y", "Kiambu_elevation")]
View(data)


colnames(data) <- c("x", "y", "altitude")
View(data)

# K-Means clustering and Analysis

K_Means <- kmeans(
  data, 
  center = 5, 
  iter.max = 30, 
  nstart = 10
)
str(K_Means)

plot(
  data, 
  center = 5,
  col = K_Means$cluster, 
  cex = 2,
  pch = 20,
  main = "K-Means Clustering"
)

# points(K_Means)


