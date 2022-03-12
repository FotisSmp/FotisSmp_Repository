dat=mtcars
pmatrix=scale(dat)
d=dist(pmatrix)
c=hclust(d,method = "ward.D2")
plot(c)
rect.hclust(c,k=4)
groups<-cutree(c,k=4)
table(mtcars$cyl,groups)
