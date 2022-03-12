
R version 4.1.2 (2021-11-01) -- "Bird Hippie"
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> local({pkg <- select.list(sort(.packages(all.available = TRUE)),graphics=TRUE)
+ if(nchar(pkg)) library(pkg, character.only=TRUE)})
Loading required package: tibble
Loading required package: bitops
Rattle: A free graphical interface for data science with R.
Version 5.4.0 Copyright (c) 2006-2020 Togaware Pty Ltd.
Type 'rattle()' to shake, rattle, and roll your data.
> utils:::menuInstallPkgs()
--- Please select a CRAN mirror for use in this session ---
trying URL 'https://ftp.cc.uoc.gr/mirrors/CRAN/bin/windows/contrib/4.1/rpart_4.1.16.zip'
Content type 'application/zip' length 983114 bytes (960 KB)
downloaded 960 KB

trying URL 'https://ftp.cc.uoc.gr/mirrors/CRAN/bin/windows/contrib/4.1/rpart.plot_3.1.0.zip'
Content type 'application/zip' length 1034867 bytes (1010 KB)
downloaded 1010 KB

package ‘rpart’ successfully unpacked and MD5 sums checked
package ‘rpart.plot’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Dimitris\AppData\Local\Temp\RtmpkJXwIS\downloaded_packages
> set.seed(1)
> x=sample(10,5,replace = T)
> x
[1] 9 4 7 1 2
> e=rnorm(5)
> e
[1]  1.2724293  0.4146414 -1.5399500 -0.9285670 -0.2947204
> y=2*x+1+e
> y
[1] 20.272429  9.414641 13.460050  2.071433  4.705280
> plot(x,y,xlim=c(-0.5,10.5),ylim=c(-0.5,21))
> abline(1,2)
> model=lm(y~x)
> summary(model)

Call:
lm(formula = y ~ x)

Residuals:
      1       2       3       4       5 
 0.9266  0.7064 -1.6307 -0.2543  0.2520 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)   
(Intercept)   0.1983     0.9608   0.206  0.84974   
x             2.1275     0.1748  12.168  0.00119 **
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.175 on 3 degrees of freedom
Multiple R-squared:  0.9801,    Adjusted R-squared:  0.9735 
F-statistic: 148.1 on 1 and 3 DF,  p-value: 0.001195

> p=predict(model,as.data.frame(x))
> rbind(y,p)
         1        2        3        4        5
y 20.27243 9.414641 13.46005 2.071433 4.705280
p 19.34578 8.708265 15.09077 2.325756 4.453259
> library(rpart)
> library(rattle)
> library(rpart.plot)
> tree_model<-rpart(mpg~.,data = mtcars,method = "anova")
> summary(tree_model)
Call:
rpart(formula = mpg ~ ., data = mtcars, method = "anova")
  n= 32 

          CP nsplit rel error    xerror      xstd
1 0.64312523      0 1.0000000 1.0888852 0.2625812
2 0.09748407      1 0.3568748 0.6045991 0.1640369
3 0.01000000      2 0.2593907 0.4766830 0.1054551

Variable importance
 cyl disp   hp   wt qsec   vs carb 
  20   20   19   16   12   11    1 

Node number 1: 32 observations,    complexity param=0.6431252
  mean=20.09062, MSE=35.18897 
  left son=2 (21 obs) right son=3 (11 obs)
  Primary splits:
      cyl  < 5      to the right, improve=0.6431252, (0 missing)
      wt   < 2.3925 to the right, improve=0.6356630, (0 missing)
      disp < 163.8  to the right, improve=0.6130502, (0 missing)
      hp   < 118    to the right, improve=0.6010712, (0 missing)
      vs   < 0.5    to the left,  improve=0.4409477, (0 missing)
  Surrogate splits:
      disp < 142.9  to the right, agree=0.969, adj=0.909, (0 split)
      hp   < 101    to the right, agree=0.938, adj=0.818, (0 split)
      wt   < 2.5425 to the right, agree=0.906, adj=0.727, (0 split)
      qsec < 18.41  to the left,  agree=0.844, adj=0.545, (0 split)
      vs   < 0.5    to the left,  agree=0.844, adj=0.545, (0 split)

Node number 2: 21 observations,    complexity param=0.09748407
  mean=16.64762, MSE=9.451066 
  left son=4 (7 obs) right son=5 (14 obs)
  Primary splits:
      hp   < 192.5  to the right, improve=0.5530828, (0 missing)
      cyl  < 7      to the right, improve=0.5068475, (0 missing)
      disp < 266.9  to the right, improve=0.5068475, (0 missing)
      wt   < 3.49   to the right, improve=0.4414890, (0 missing)
      drat < 3.075  to the left,  improve=0.1890739, (0 missing)
  Surrogate splits:
      disp < 334    to the right, agree=0.857, adj=0.571, (0 split)
      wt   < 4.66   to the right, agree=0.810, adj=0.429, (0 split)
      qsec < 15.455 to the left,  agree=0.810, adj=0.429, (0 split)
      carb < 3.5    to the right, agree=0.762, adj=0.286, (0 split)
      gear < 4.5    to the right, agree=0.714, adj=0.143, (0 split)

Node number 3: 11 observations
  mean=26.66364, MSE=18.48959 

Node number 4: 7 observations
  mean=13.41429, MSE=4.118367 

Node number 5: 14 observations
  mean=18.26429, MSE=4.276582 

> plot(tree_model)
> text(tree_model)
> fancyRpartPlot(tree_model)
> res<-predict(tree_model,mtcars[,2:11])
> View(cbind(mtcars[,1],res))
> save.image("C:\\Users\\Dimitris\\Desktop\\E Learning\\ÓÔÁÔÉÓÔÉÊÇ ÓÔÇÍ R\\R\\.RData")
> 
