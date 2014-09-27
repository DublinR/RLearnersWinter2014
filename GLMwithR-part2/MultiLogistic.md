Multinomial Logistic
========================================================

### Getting the Data

```r
library(foreign)
ml <- read.dta("http://www.ats.ucla.edu/stat/data/hsbdemo.dta")
```

###  Some Exploratory Data Analysis

```r
summary(ml)
```

```
##        id           female        ses         schtyp          prog    
##  Min.   :  1.0   male  : 91   low   :47   public :168   general : 45  
##  1st Qu.: 50.8   female:109   middle:95   private: 32   academic:105  
##  Median :100.5                high  :58                 vocation: 50  
##  Mean   :100.5                                                        
##  3rd Qu.:150.2                                                        
##  Max.   :200.0                                                        
##       read          write           math         science    
##  Min.   :28.0   Min.   :31.0   Min.   :33.0   Min.   :26.0  
##  1st Qu.:44.0   1st Qu.:45.8   1st Qu.:45.0   1st Qu.:44.0  
##  Median :50.0   Median :54.0   Median :52.0   Median :53.0  
##  Mean   :52.2   Mean   :52.8   Mean   :52.6   Mean   :51.9  
##  3rd Qu.:60.0   3rd Qu.:60.0   3rd Qu.:59.0   3rd Qu.:58.0  
##  Max.   :76.0   Max.   :67.0   Max.   :75.0   Max.   :74.0  
##      socst               honors        awards          cid      
##  Min.   :26.0   not enrolled:147   Min.   :0.00   Min.   : 1.0  
##  1st Qu.:46.0   enrolled    : 53   1st Qu.:0.00   1st Qu.: 5.0  
##  Median :52.0                      Median :1.00   Median :10.5  
##  Mean   :52.4                      Mean   :1.67   Mean   :10.4  
##  3rd Qu.:61.0                      3rd Qu.:2.00   3rd Qu.:15.0  
##  Max.   :71.0                      Max.   :7.00   Max.   :20.0
```

```r

table(ml$ses, ml$female)
```

```
##         
##          male female
##   low      15     32
##   middle   47     48
##   high     29     29
```

```r

# Different Syntax, but same operation
with(ml, table(ses, prog))
```

```
##         prog
## ses      general academic vocation
##   low         16       19       12
##   middle      20       44       31
##   high         9       42        7
```

```r
boxplot(ml$write, horizontal = T, col = "lightblue")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

###  Some Data Management

```r

summary(ml$prog)
```

```
##  general academic vocation 
##       45      105       50
```

```r
ml$prog2 <- relevel(ml$prog, ref = "academic")
summary(ml$prog2)
```

```
## academic  general vocation 
##      105       45       50
```

### Fitting a Model
Implement a multinomial logistic regression model by using the `multinom` command in the ***nnet*** package.

```r
library(nnet)
test <- multinom(prog2 ~ ses + write, data = ml)
```

```
## # weights:  15 (8 variable)
## initial  value 219.722458 
## iter  10 value 179.982880
## final  value 179.981726 
## converged
```

```r

summary(test)
```

```
## Call:
## multinom(formula = prog2 ~ ses + write, data = ml)
## 
## Coefficients:
##          (Intercept) sesmiddle seshigh    write
## general        2.852   -0.5333 -1.1628 -0.05793
## vocation       5.218    0.2914 -0.9827 -0.11360
## 
## Std. Errors:
##          (Intercept) sesmiddle seshigh   write
## general        1.166    0.4437  0.5142 0.02141
## vocation       1.164    0.4764  0.5956 0.02222
## 
## Residual Deviance: 360 
## AIC: 376
```

- The model summary output has a block of coefficients and a block of standard errors. 
- Each of these blocks has one row of values corresponding to a model equation. 
- Focusing on the block of coefficients, we can look at the first row comparing prog = "general" to our baseline prog = "academic" and the second row comparing prog = "vocation" to our baseline prog = "academic". - If we consider our coefficients from the first row to be *b.1* and our coefficients from the second row to be *b.2*, we can write our model equations: (TEX)
