# Draw a plot
plot(1,3)

# Draw a line
plot(1:10, type="l")

#add color to the line

plot(1:10, type="l", col="red")

#change the width of the line

plot(1:10, type="l", col="red", lwd = 2)

#Draw multiple lines

line1<- c(1,3,4,6,7,9)
line2<- c(2,4,5,7,9,8)
plot(line1, type='l', col='blue')
lines(line2, type='l', col='red')

#Draw a scatter plot
x<- c(1,3,5,7,8,22,33,52,5)
y<-c(5,4,6,8,9,33,2,3,32)
plot(x,y, col='red')

# add labels to the scatter plot
plot(x,y, col='red', main="Car Fuel cost", xlab= 'mpg', ylab='dollar', cex.main=2)

#Draw a pie chart
x<- c(20,40,10,10,15,5)
pie(x)
#add label to the pie chart
mylabel <- c('a','b','c','d','e')
pie(x, label=mylabel, main='car' )

#create your own color
colors<- c('red','blue','pink','yellow', 'magenta')
pie(x, label=mylabel, main='car', col=colors)
# add legend
legend('bottomleft', mylabel, fill=colors)

# Draw bar graphs
x<-c("a","b","c")
y<-c(3,4,5)
barplot(y, names.arg=x, col='red')

# Use of functions: apply, lapply, sapply, tapply
# https://www.geeksforgeeks.org/apply-lapply-sapply-and-tapply-in-r/
# Syntax: apply( x, margin, function )
# Syntax: tapply( x, index,  fun )
# Syntax: lapply( x, fun )
# Syntax: sapply( x, fun )

data<- data.frame(a=c(2,3,4), b=c(4,5,6), c=c(4,6,7))
apply(data,1,mean)
apply(data, 2, mean)

data1<- data.frame(a=c(2,3,4,4,5,6), b=c(4,5,6,3,4,5), c=c(4,6,7,7,8,9), d=c('m','n','n','n','n','m'))
tapply(data1$c, data1$d, mean)

lapply(data,mean)
sapply(data,mean)
# array, list, sequence, vector, matrix, dataframe
# https://www.mssqltips.com/sqlservertip/6503/data-structures-in-r-including-vector-matrix-array-list-and-data-frame/

#a Vector is created using the R command c() that stands for combine.
#Example of atomic vectors: integer, double, logical, character

int_vct <- c(1.L, 6L, 10L) #L for indicating explicit integer
dbl_vct <- c(1, 2.5, 4.5)
myList <- list(1:5, "MSSQLTips", c(TRUE, FALSE, TRUE), c(3.3, 9.9, 12.2))
myarr = array(0, 3)
myarr = array(2, c(2,3))
myMatrix <- matrix(1:6, ncol = 3, nrow = 2)
#seq
x<- seq(8)
x<- seq(1:3)
x<- seq(9,pi)
x<- seq(1,9,pi)
x<- seq(10,3)
?seq

#attributes
attributes(myList)
attr(myList, "myattribute")<- "MyFirstAttr"

#list/matrix to dataframe

df<- as.data.frame(myMatrix)
colnames(df)<- c("col1","col2","col3")
?col
?colnames
----------------------------------------------------------
  #### Codes for common statistical models
  --------------------------------------------------------
# t-test
  
  
#anova
  
  
#simple linear regression
---------------------------------------------------------------------
#logistic regression
-----------------------------------------------
# Installing the package
install.packages("dplyr")

# Loading package
library(dplyr)

# Summary of dataset in package
summary(?mtcars)



# For Logistic regression
install.packages("caTools") 

# For ROC curve to evaluate model
install.packages("ROCR")     

# Loading package
library(caTools)
library(ROCR)

# Splitting dataset
split <- sample.split(mtcars, SplitRatio = 0.8)
split

train_reg <- subset(mtcars, split == "TRUE")
test_reg <- subset(mtcars, split == "FALSE")

# Training model
logistic_model <- glm(vs ~ wt + disp,
                      data = train_reg,
                      family = "binomial")
logistic_model

# Summary
summary(logistic_model)


predict_reg <- predict(logistic_model,
                       test_reg, type = "response")
predict_reg
--------------------------------------------------------------------
# Loading package
library(dplyr)

# Summary of dataset in package
summary(mtcars)


#model: linear mixed effect model
## from youtube:
  
weight <- c(102,96,83,79,97,93,79,77,95,87,78,75,93,85,74,72)
subjects<- rep(1:4,4)
diet<- rep(c("A","A","B","B"),4)
weeks<- rep(0:3, c(4,4,4,4))
df<- data.frame(weight, subjects, diet, weeks)
str(df)


library(lme4)
m4<- lmer(weight~ weeks + (1+weeks|subjects), REML = F, data=df)
summary(m4)
coef(m4)$subjects
confint(m4)
ranef(m4)

df1<- df%>% filter(subjects== c(1,2))

  
#generalized linear model
  
  
#generalized linear mixed effect model



-----------------------------------------------------------------
  
#Non-parametric bootstrap
  
# Use the tidyverse package
library(tidyverse)
# How to draw non-parametric bootstraps
sample_data <- c(3, 5, 70, 2, 88, 1, 13, 13, 4, 2, 33, 412, 1)
nonparametric_bootstrap_means <- map_df(1:100, function(i) {
bootstrap_sample_data <- sample(sample_data, length(sample_data), replace = TRUE)
data.frame(bootstrap_mean = mean(bootstrap_sample_data))
})
# The following variable is your list of non-parametric bootstrapped samples
nonparametric_bootstrap_means

nonparametric_bootstrap_means <-nonparametric_bootstrap_means$bootstrap_mean
hist(nonparametric_bootstrap_means)
  

#parametric bootstrap


# How to draw parametric bootstraps
sample_data <- c(3, 5, 70, 2, 88, 1, 13, 13, 4, 2, 33, 412, 1)
parametric_bootstrap_means <- map_df(1:100, function(i) {
  bootstrap_sample_data <- rnorm(length(sample_data), mean(sample_data), sd(sample_data))
  data.frame(bootstrap_mean = mean(bootstrap_sample_data))
})
# The following variable is your list of parametric bootstrapped samples
parametric_bootstrap_means
parametric_bootstrap_means <-parametric_bootstrap_means$bootstrap_mean
hist(parametric_bootstrap_means)  
  
  
----  
# how sample function works 
x<- c(4,5,9,7)
sample(x,6,replace = TRUE, prob = c(.2,.3,.4,1))
---  
  
  


