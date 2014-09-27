Menarche Example- Logistic Regression with One Numerical Predictor
========================================================

In the "MASS" library there is a data set called "*menarche*" (, in which there are three variables: "Age" (average age of age homogeneous groups of girls), "Total" (number of girls in each group), and "Menarche" (number of girls in the group who have reached menarche).


```r
library("MASS")
data(menarche)
tail(menarche)
```

```
##      Age Total Menarche
## 20 14.83   102       95
## 21 15.08   122      117
## 22 15.33   111      107
## 23 15.58    94       92
## 24 15.83   114      112
## 25 17.58  1049     1049
```

```r
summary(menarche)
```

```
##       Age            Total         Menarche     
##  Min.   : 9.21   Min.   :  88   Min.   :   0.0  
##  1st Qu.:11.58   1st Qu.:  98   1st Qu.:  10.0  
##  Median :13.08   Median : 105   Median :  51.0  
##  Mean   :13.10   Mean   : 157   Mean   :  92.3  
##  3rd Qu.:14.58   3rd Qu.: 117   3rd Qu.:  92.0  
##  Max.   :17.58   Max.   :1049   Max.   :1049.0
```



```r
plot(Menarche/Total ~ Age, data = menarche)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

From the graph at right, it appears a logistic fit is called for here. The fit would be done this way... 

```r
glm.out = glm(cbind(Menarche, Total - Menarche) ~ Age, family = binomial(logit), 
    data = menarche)
```



-  First, `glm( )` is the function used to do generalized linear models, and will be explained more completely in another tutorial. 
- With "`family=`" set to "binomial" with a "logit" link, `glm( )` produces a logistic regression. Because we are using `glm( )` with binomial errors in the response variable, the ordinary assumptions of least squares linear regression (normality and homoscedasticity) don't apply. Second, our data frame does not contain a row for every case (i.e., every girl upon whom data were collected). 

- Therefore, we do not have a binary (0,1) coded response variable. If we feed `glm( )` a table (or matrix) in which the first column is number of successes and the second column is number of failures, `R` will take care of the coding. 
- In the above analysis, we made that table on the fly inside the model formula by binding "Menarche" and "Total - Menarche" into the columns of a table using `cbind( )`.

- Let's look at how closely the fitted values from our logistic regression match the observed values:


```r
plot(Menarche/Total ~ Age, data = menarche)
lines(menarche$Age, glm.out$fitted, type = "l", col = "red")
title(main = "Menarche Data with Fitted Logistic Regression Line")
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 

#### References
Milicer, H. and Szczotka, F., 1966, Age at Menarche in Warsaw girls in 1965, (Human Biology, 38, 199-203)

