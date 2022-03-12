tablered=read.table(file.choose(),header = T,sep = ";",nrows = -1)
tablered
class(tablered)
View(tablered)
str(tablered)
summary(tablered)
View(tablered[tablered$quality>=8,])
cor(tablered)
View(cor(tablered))
cor(tablered$alcohol,tablered$quality)
x<-tablered$alcohol
y<-tablered$quality
plot(x,y)
best<-tablered[tablered$quality==8,c(11,12)]
model<-lm(y~x,data = best)
summary(model)
abline(1.87497,0.36084)
anova(model)
x_new<-c(9.4,9.6)
p<-predict(model,data.frame(x=x_new))
p
model2<-lm(quality~.,data = tablered)
summary(model2)
