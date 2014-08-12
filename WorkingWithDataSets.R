getwd()
#############################################################################################
# load the data into R
idahoData <- read.csv("ss06hid.csv", header=TRUE)
# are we sure it's just Idaho data?
table(idahoData$ST)
dim(idahoData)

head(idahoData)
head(idahoData)[,1:10]

summary(idahoData[,1:10])

table(idahoData$TYPE)
names(idahoData)
summary(idahoData[,11:30])

str(idahoData[,11:50])

##############################################################################################

summary(idahoData$ST)
# How many housing units [are] worth more than $1,000,000?
table(idahoData$TYPE,idahoData$VAL)
