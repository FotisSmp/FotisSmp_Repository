dat=iris[,1:4]
pmatrix=scale(dat)
d=dist(pmatrix)
View(pmatrix)
c=hclust(d,method = "ward.D2")
plot(c)
rect.hclust(c,k=3)
groups<-cutree(c,k=3)
table(iris$Species,groups)
View(iris)
totwinss=c()
for (k in 2:10) {
  k_cl=kmeans(pmatrix,k)
  totwinss[k]<-k_cl$tot.withinss
}
plot(1:10,totwinss,xlab = "Number of clusters",ylab = "Total within ss")
lines(1:10,totwinss)
k_cl=kmeans(pmatrix,3)
table(iris$Species,k_cl$cluster)
