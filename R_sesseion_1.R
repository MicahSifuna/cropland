  setwd("D:\\GDM\\session1\\data")
  
  # install.packages("raster")
  
  library(raster)
  
  # install.packages("rgdal")
  library(rgdal)
  
  dir()
  
  elevation <- raster("croplands.tiff")
  
  plot(elevation, main = "Nairobi Cropland-Extent 2019")
  
  slopeKiambu <- terrain(elevation, opt = "slope")
  plot(slopeKiambu, main = "Kiambu Slope")
  
  # combine two datasets
  
  raster_terrain <- stack(elevation, slopeKiambu)
  raster_terrain
  #sampling elevation
  s <-sampleRandom(elevation, size=500, cell=TRUE, sp=TRUE)
  s
  
  sampleslope <-sampleRandom(slopeKiambu, size=1000, cell=TRUE, sp=TRUE)
  
  sampleslope@coords
  sampleslope@data
  
  plot(slopeKiambu, main = "Sample slope")
  plot(sampleslope, main = "Sample slope", pch = 20, cex = 0.1, add = TRUE)
  
  # extract values to points
  rasterValues <- extract(raster_terrain, sampleslope)
  View(rasterValues)
  
  
  
  
