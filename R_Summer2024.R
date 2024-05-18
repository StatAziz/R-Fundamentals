
# ----- 05/12/2024------------------------------------------------------------------------------
fruit<- c("apple", "banana","lemon")
price<- c(10, 20, 30)
df<- data.frame(fruit, price) # okay
#df<- data.frame(c(fruit, price)) # it gives one column
str(df)
df[1,2]
df[1,]
df[,1]
df$fruit[2]
mean(df$price[2:3])

#pipe
library(dplyr)
df %>% select(fruit)      # %>% read as "then do"
df %>% select(fruit)%>% slice(2:3)
df$fruit


df%>% select(price) # output is columns
df%>% select(price) %>% mean() # gives NA as mean function only works on vector
df%>% pull(price) # output is vector
df%>% pull(price) %>% mean() # gives right answer

df%>% order(price, decreasing = False) # gives error as order works on vector only
df %>% pull(price)%>% order() # now works as pull() creates vector
df %>% arrange(desc(price)) # arrange works on dataframe
df %>% arrange(desc(price)) %>% slice(2) # to find the nth one in dataframe format
df %>% arrange(desc(price)) %>% slice(2) %>% pull(price) # gives only price
# -----------05/13/2024------------------------------------------------------------------
#rep functions
rep(3,3)
rep(1:3,3)
rep(NA,3)
rep(rnorm(2),3)

#sample function
sample(5)
sample(1:5)
a<- c(2,3,4,4,5,3,3,4,3,9,0)

#sample(data, size, replace=T/F)
sample(a,3, replace= TRUE)

#seq function
seq(1:8)
seq(1,20,2.5)
seq(0,1,0.2)

#replace function
df<- data.frame(x= c(1,2,3,4), y= c(5,6,7,8))
new_df<- replace(df$y, df$y>5, 10)
new_df
new_df<- replace(df$y, c(2,4), c(100,200))
new_df
new_df<- replace(df$y, 3, .9)
new_df

#----------5/14/2024--------------------------------------------------------------------

#mutate function (from dplyr package to introduce/update variables in dataset)
df<- data.frame(x= c(1,2,3,4), y= c(5,6,7,8))
library(dplyr)
df<- df %>% mutate(z=x+y)
df
df<- df%>% mutate(x=x+1)
df

#filter function
df<- df%>% filter(z>9)
df
df%>% filter(z>9)%>%select(x,y)

#subset function
df<- data.frame(x= c(1,2,3,4), y= c(5,6,7,8))
df<- df %>% mutate(z=x+y)
df<- df%>% filter(z>9)
df<- df%>% subset(z>9)
df
df1<- df%>% filter(x==1 & z==6)       #they give same results, differ in speed for large datasets and subset require
                                      # no library.
df1<- df%>% subset(x==1 & z==6)

#----------5/15/2024-----------------------------------------------------------------------
library(ggplot2)
library(dplyr)
mtcars %>% ggplot(aes(x=hp, y=mpg, col = disp, ))+ geom_point()+
labs(title = "mpg vs hp", x= "hp", y ="mpg")

#adding facet_grid

mtcars %>% ggplot(aes(x=hp, y=mpg, col = disp, shape=factor(cyl)))+ geom_point()+
  labs(title = "mpg vs hp", x= "hp", y ="mpg") +facet_grid(.~cyl)


#adding line
mtcars %>% ggplot(aes(x=hp, y=mpg, col = disp, shape=factor(cyl)))+ geom_point()+
  labs(title = "mpg vs hp", x= "hp", y ="mpg") +facet_grid(.~cyl) +geom_smooth(method=lm, col="red")
#----------5/16/2024----------------------------------------------------------------------------

# for loop from geeksforgeeks
for (i in 1: 4)
{
  print(i ^ 2)
}

# nested for loop
for (i in 1:3)
{
  for (j in 1:i)
  {
    print(i * j)
  }
}
# break in for loop
for (i in c(3, 6, 23, 19, 0, 21))
{
  if (i == 0)
  {
    break
  }
  print(i)
}
print("Outside Loop")

# next in for loop
for (i in c(3, 6, 23, 19, 0, 21))
{
  if (i == 0)
  {
    next
  }
  print(i)
}
print('Outside Loop')


# create a matrix of data
mat <- matrix(rnorm(100), ncol = 5)
#mat<- as.data.frame(mat)

# set up the plot layout
par(mfrow = c(2, 3))

# loop over columns of the matrix
for (i in 1:5) {
  # create a histogram for each column
  hist(mat[, i], main = paste("Column", i), xlab = "Values", col = "lightblue")
}
#-----------5/17/2024---------------------------------------------------------------------------------------------

# functions in R from https://www.tutorialspoint.com/r/r_functions.htm

# Create user-defined function with arguments.
f1 <- function(a,b,c) {
  result <- a * b + c
  print(result)
}

# Call the function by position of arguments.
f1(5,3,11)

# Create a function with arguments.
f2 <- function(a = 3, b = 6) {
  result <- a * b
  print(result)
}

# Call the function without giving any argument.
f2()

# Call the function with giving new values of the argument.
f2(9,5)


# Create a function with arguments.
f3 <- function(a, b) {
  print(a^2)
  print(a)
  print(b)
}

# Evaluate the function without supplying one of the arguments.
f3(6)

# Create a function to print squares of numbers in sequence.
f4 <- function(a) {
  for(i in 1:a) {
    b <- i^2
    print(b)
  }
}
f4(10)

# Create a function to print squares of numbers in sequence.
f5 <- function(a) {
  for(i in 1:a) {
    b <- i^2
    print(b)
  }
}

# Call the function new.function supplying 6 as an argument.
f5(6)

# Create a function without an argument.
f6 <- function() {
  for(i in 1:5) {
    print(i^2)
  }
}	

# Call the function without supplying an argument.
f6()

#---------------5/18/2024-------------------------------------------------------------------------
# map function in R from https://www.statology.org/map-function-in-r/

# The map() function from the purrr package in R can be used to apply some function to each element in a vector or list and return a list as a result.
# 
# This function uses the following basic syntax:
#   
# map(.x, .f)
# 
# where:
#   
# .x: A vector or list
# .f: A function


library(purrr)

#define vector
data <- 1:3

#apply rnorm() function to each value in vector
data %>%
  map(function(x) rnorm(5, x))

#define vector
data <- c(2, 4, 10, 15, 20)

#calculate square of each value in the vector
data %>%
  map(function(x) x^2)
#define list of vectors
data <- list(c(1, 2, 3),
             c(4, 5, 6),
             c(7, 8, NA))

#calculate mean value of each vector in list
data %>%
  map(mean, na.rm=TRUE)
#---------------------------------------------------------------------------------------------