whitewine=read.csv(file.choose(),header = T,sep = ";",nrows = -1)
whitewine
class(whitewine)
View(whitewine)
str(whitewine)
summary(whitewine)
cor(whitewine)
View(cor(whitewine))
cor(whitewine$alcohol,whitewine$quality)
View(whitewine[whitewine$quality>=8,])
x<-whitewine$alcohol
y<-whitewine$quality
plot(x,y)
thebest<-whitewine[whitewine$quality==8,c(11,12)]
modelo<-lm(y~x,data = thebest)
summary(modelo)
abline(2.582009,0.313469)
anova(modelo)
x_neo<-c(5.2,6.6)
pi<-predict(modelo,data.frame(x=x_neo))
pi
modelo1<-lm(quality~.,data = whitewine)
summary(modelo1)
