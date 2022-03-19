data<-scale(iris[,-c(5)])
library(NbClust)
res.nb<-NbClust(data,
                min.nc = 2,max.nc = 10,
                method = "complete")
