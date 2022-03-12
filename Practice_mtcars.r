dat=mtcars
pmatrix=scale(dat)
d=dist(pmatrix)
c=hclust(d,method = "ward.D2")
plot(c)
rect.hclust(c,k=4)
groups<-cutree(c,k=4)
table(mtcars$cyl,groups)
totwinss=c()
for (k in 2:10) {
  k_cl=kmeans(pmatrix,k)
  totwinss[k]<-k_cl$tot.withinss
}
plot(1:10,totwinss,
     xlab = "Number pf clusters",ylab = "Total within ss")
lines(1:10,totwinss)
k_cl=kmeans(pmatrix,4)
table(mtcars$cyl,k_cl$cluster)
