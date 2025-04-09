#Code from https://github.com/laurabenestan/db-RDA-and-db-MEM 
#codep, adespatial, adegraphics, vegan, ape, car, adegenet, dplyr, assigner
library(codep)
library(adespatial)
library(adegraphics)
library(vegan)
library(ape)
library(car)
library(adegenet)
library(dplyr)
#library(assigner)
Env=read.csv2("/clim_data_SNC_NA_filtered_ordered.csv")

Coor=Env[,5:6]
Coorxy=Env[,5:6]
#Look the spatial distribution

plot(Coor, asp=1)
#Compute spatial distances among sites accounting for the earth curvature.

DistSpatial=gcd.hf(Coor) 
#Compute MEM by keeping default setting for truncation (length of the longest edge of the minimum spanning tree will be used as the threshold) and just positive MEM.

dbmem = dbmem(DistSpatial)
#Look at general output. With this threshold, we get 19 MEMs.

summary(dbmem)
#Specify where to find the function to be sure of the function version to use in the package adegraphics.

adegraphics::s.label(Coor, nb = attr(dbmem, "listw"))
#Visualising the 19 MEMs by using the Coorxy object. The 1rst dbmems are large spatial scales, the last dbmems are small spatial scales. dbmem can be used in stats like any other env variables.

ade4::s.value(Coorxy, dbmem[,1])
write.csv2(dbmem,"/dbmems_SNC.csv", row.names = FALSE)
