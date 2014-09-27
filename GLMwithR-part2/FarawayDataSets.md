Faraway Data Sets
========================================================

1. Undercounted votes in Georgia in 2000 election - ***gavote***
2. 
3. Spache Shuttle Challenger O-rings - ***orings*** (Binary Logistic Regression)
4. Pima Native American Women - ***pima***
5. 
6. Trout Eggs - ***troutegg***

<hr>

### gavote
- The data comes from the US presidential election in the state of Georgia. 
- The undercount is the difference between the number of ballots cast and votes recorded. 
- Voters may have chosen not to vote for president, voted for more than one candidate (disqualified) or the equipment may have failed to register their choice.



```r
library(faraway)
data(gavote)
names(gavote)
```

```
##  [1] "equip"   "econ"    "perAA"   "rural"   "atlanta" "gore"    "bush"   
##  [8] "other"   "votes"   "ballots"
```

```r
tail(gavote)
```

```
##           equip   econ perAA rural    atlanta gore  bush other votes
## WHITE     LEVER middle 0.019 rural notAtlanta 2014  4857   172  7043
## WHITFIELD OS-PC   rich 0.040 rural notAtlanta 7034 15852   416 23302
## WILCOX    LEVER   poor 0.265 rural notAtlanta  962  1381    22  2365
## WILKES    LEVER middle 0.386 rural notAtlanta 1940  2044    42  4026
## WILKINSON LEVER   poor 0.408 rural notAtlanta 1884  1800    56  3740
## WORTH     PUNCH   poor 0.266 rural notAtlanta 2214  3792    55  6061
##           ballots
## WHITE        7338
## WHITFIELD   23854
## WILCOX       2430
## WILKES       4136
## WILKINSON    3792
## WORTH        6458
```

```r
summary(gavote)
```

```
##    equip        econ        perAA         rural           atlanta   
##  LEVER:74   middle:69   Min.   :0.000   rural:117   Atlanta   : 15  
##  OS-CC:44   poor  :72   1st Qu.:0.112   urban: 42   notAtlanta:144  
##  OS-PC:22   rich  :18   Median :0.233                               
##  PAPER: 2               Mean   :0.243                               
##  PUNCH:17               3rd Qu.:0.348                               
##                         Max.   :0.765                               
##       gore             bush            other          votes       
##  Min.   :   249   Min.   :   271   Min.   :   5   Min.   :   832  
##  1st Qu.:  1386   1st Qu.:  1804   1st Qu.:  30   1st Qu.:  3506  
##  Median :  2326   Median :  3597   Median :  86   Median :  6299  
##  Mean   :  7020   Mean   :  8929   Mean   : 382   Mean   : 16331  
##  3rd Qu.:  4430   3rd Qu.:  7468   3rd Qu.: 210   3rd Qu.: 11846  
##  Max.   :154509   Max.   :140494   Max.   :7920   Max.   :263211  
##     ballots      
##  Min.   :   881  
##  1st Qu.:  3694  
##  Median :  6712  
##  Mean   : 16927  
##  3rd Qu.: 12251  
##  Max.   :280975
```

```r
dim(gavote)
```

```
## [1] 159  10
```

```r
table(gavote$atlanta, gavote$rural)
```

```
##             
##              rural urban
##   Atlanta        1    14
##   notAtlanta   116    28
```


<hr>

### pima
- The National Institute of Diabetes and Digestive and Kidney Diseases conducted a study on 768 adult pima native american in the Phoenix area.
- The purpose of the study was to investigate factors related to diabetes.



```r

library(faraway)
data(pima)
names(pima)
```

```
## [1] "pregnant"  "glucose"   "diastolic" "triceps"   "insulin"   "bmi"      
## [7] "diabetes"  "age"       "test"
```

```r
dim(pima)
```

```
## [1] 768   9
```

```r

summary(pima)
```

```
##     pregnant        glucose      diastolic        triceps    
##  Min.   : 0.00   Min.   :  0   Min.   :  0.0   Min.   : 0.0  
##  1st Qu.: 1.00   1st Qu.: 99   1st Qu.: 62.0   1st Qu.: 0.0  
##  Median : 3.00   Median :117   Median : 72.0   Median :23.0  
##  Mean   : 3.85   Mean   :121   Mean   : 69.1   Mean   :20.5  
##  3rd Qu.: 6.00   3rd Qu.:140   3rd Qu.: 80.0   3rd Qu.:32.0  
##  Max.   :17.00   Max.   :199   Max.   :122.0   Max.   :99.0  
##     insulin           bmi          diabetes          age      
##  Min.   :  0.0   Min.   : 0.0   Min.   :0.078   Min.   :21.0  
##  1st Qu.:  0.0   1st Qu.:27.3   1st Qu.:0.244   1st Qu.:24.0  
##  Median : 30.5   Median :32.0   Median :0.372   Median :29.0  
##  Mean   : 79.8   Mean   :32.0   Mean   :0.472   Mean   :33.2  
##  3rd Qu.:127.2   3rd Qu.:36.6   3rd Qu.:0.626   3rd Qu.:41.0  
##  Max.   :846.0   Max.   :67.1   Max.   :2.420   Max.   :81.0  
##       test      
##  Min.   :0.000  
##  1st Qu.:0.000  
##  Median :0.000  
##  Mean   :0.349  
##  3rd Qu.:1.000  
##  Max.   :1.000
```



### orings

- The 1986 crash of the space shuttle Challenger was linked to failure of O-ring seals in the rocket engines. 
- Data was collected on the 23 previous shuttle missions. 
- The launch temperature on the day of the crash was 31F.


```r
data(orings)
summary(orings)
```

```
##       temp          damage     
##  Min.   :53.0   Min.   :0.000  
##  1st Qu.:67.0   1st Qu.:0.000  
##  Median :70.0   Median :0.000  
##  Mean   :69.6   Mean   :0.478  
##  3rd Qu.:75.0   3rd Qu.:1.000  
##  Max.   :81.0   Max.   :5.000
```

```r
table(orings$damage)
```

```
## 
##  0  1  5 
## 16  6  1
```

```r
tail(orings)
```

```
##    temp damage
## 18   75      1
## 19   76      0
## 20   76      0
## 21   78      0
## 22   79      0
## 23   81      0
```

```r
names(orings)
```

```
## [1] "temp"   "damage"
```

```r
orings1 = orings[orings$damage < 5, ]
boxplot(temp ~ damage, data = orings1, horizontal = TRUE, col = c("lightblue", 
    "lightgreen"))
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Trout Eggs

Survival of trout eggs depending on time and location

#### Description

- Boxes of trout eggs were buried at five different stream locations and retrieved at 4 different times. 
- The number of surviving eggs was recorded. 
- The box was not returned to the stream.


```r
## Trout Eggs

library(faraway)
data(troutegg)

tail(troutegg)
```

```
##    survive total location period
## 15      18    88        5      8
## 16     141   155        1     11
## 17     104   122        2     11
## 18      91   125        3     11
## 19     111   132        4     11
## 20       0   138        5     11
```

```r
summary(troutegg)
```

```
##     survive          total       location period
##  Min.   :  0.0   Min.   : 86.0   1:4      4 :5  
##  1st Qu.: 74.5   1st Qu.: 96.8   2:4      7 :5  
##  Median : 90.0   Median :107.0   3:4      8 :5  
##  Mean   : 81.3   Mean   :111.3   4:4      11:5  
##  3rd Qu.:104.0   3rd Qu.:123.5   5:4            
##  Max.   :141.0   Max.   :155.0
```

```r
names(troutegg)
```

```
## [1] "survive"  "total"    "location" "period"
```

```r
dim(troutegg)
```

```
## [1] 20  4
```

