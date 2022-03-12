set.seed(1)
x=sample(10,5,replace = T)
x
e=rnorm(5)
e
y=2*x+1+e
y
plot(x,y,xlim=c(-0.5,10.5),ylim=c(-0.5,21))
abline(1,2)
model=lm(y~x)
summary(model)
p=predict(model,as.data.frame(x))
rbind(y,p)
library(rpart)
library(rattle)
library(rpart.plot)
tree_model<-rpart(mpg~.,data = mtcars,method = "anova")
summary(tree_model)
plot(tree_model)
text(tree_model)
fancyRpartPlot(tree_model)
res<-predict(tree_model,mtcars[,2:11])
View(cbind(mtcars[,1],res))
