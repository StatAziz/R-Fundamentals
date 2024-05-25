
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

#------------------5/19/2024----------------------------------------------------------------------
# if statement from https://www.geeksforgeeks.org/r-if-statement/

# R program to illustrate if statement
# assigning value to variable a
a <- -5

# condition
if(a > 0)
{
  print("Positive Number")  # Statement
}else{
  print("-ve number")
}
x <- 12

# Condition
if (x > 20)
{
  print("12 is less than 20")  # Statement
}
print("Hello World")

# nested if else
x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")

#-----------------5/20/2024----------------------------------------------------------------------

# while loop from https://www.geeksforgeeks.org/r-while-loop/
# R program to illustrate while loop

result <- c("Hello World")
i <- 1

# test expression 
while (i < 6) {
  
  print(result)
  
  # update expression 
  i = i + 1
}

# R program to illustrate while loop

result <- 1
i <- 1

# test expression 
while (i < 6) {
  
  print(result)
  
  # update expression 
  i = i + 1
  result = result + 1
}

# R program to illustrate while loop

result <- c("Hello World")
i <- 1

# test expression
while (i < 6) {
  
  print(result)
  
  if( i == 3){
    break}
  # update expression
  i = i + 1
}
# while loop with next
# Set an initial value for a variable
x <- 1

# Loop while x is less than 10
while (x < 10) {
  if (x == 3) {
    # Skip iteration when x is 3
    x <- x + 1
    next
  }
  print(paste("The current value of x is:", x))
  x <- x + 1
}

# Print a message after the loop has finished
print("The loop has ended.")

# while loop with if
x <- 1

while (x <= 10) {
  if (x %% 2 == 0) {
    print(paste(x, "is even"))
  } else {
    print(paste(x, "is odd"))
  }
  x <- x + 1
}
#------------------------5/21/2024------------------------------------------------------------
# with() function
# Create a sample data frame

# The with() function takes two main arguments:
# data: A data frame or list in which to look for variables.
# expr: An expression to be evaluated within the context of the data frame or list.
# Syntax: with(data, expr)

df <- data.frame(
  a = c(1, 2, 3, 4, 5),
  b = c(6, 7, 8, 9, 10)
)

# Using with() to calculate mean and standard deviation
result <- with(df, {
  mean_a <- mean(a)
  sd_a <- sd(a)
  mean_b <- mean(b)
  sd_b <- sd(b)
  list(mean_a = mean_a, sd_a = sd_a, mean_b = mean_b, sd_b = sd_b)
})

print(result)

# plotting with with()
# Create a sample data frame
df <- data.frame(
  x = rnorm(100),
  y = rnorm(100)
)

# Using with() to plot data
with(df, {
  plot(x, y, main = "Scatter plot of x and y", xlab = "x", ylab = "y")
})

# using with() in more complex scenarios
# Create a sample data frame
df <- data.frame(
  x = 1:10,
  y = 2 * (1:10) + rnorm(10)
)

# Using with() for multiple operations
result <- with(df, {
  lm_result <- lm(y ~ x)  # Fit a linear model
  summary(lm_result)      # Get the summary of the model
})

print(result)
#-----------------------------5/22/2024------------------------------------------------------

# nest() function in R
#The nest() function in R, which is part of the tidyr package, is used to convert 
# a data frame into a nested data frame. This is particularly useful for managing grouped data,
# where you want to keep related observations together in a list-column.
# Nested data frames are useful for performing operations within groups 
# and can help simplify complex data manipulation tasks.

# Syntax:
#nest(.data, ..., .key = "data")
# .data: A data frame.
# ...: Columns to nest, typically columns that are not being grouped.
# .key: Name of the new list-column created by nesting.

library(tidyr)

# Example data frame
df <- data.frame(
  group = rep(c("A", "B"), each = 3),
  value1 = 1:6,
  value2 = 6:1
)

print(df)

# Nesting the data frame by 'group'
nested_df <- df %>% nest(data = c(value1, value2))

print(nested_df)

# Access the nested data for group A
nested_df$data[[1]]

# operations on nested data
library(purrr)

# Calculate the mean of value1 and value2 for each group
library(dplyr)
means <- nested_df %>% 
  mutate(mean_values = map(data, ~ summarise(.x, mean_value1 = mean(value1), mean_value2 = mean(value2))))

print(means)

# you can unnest if needed
# Unnesting the means
unnested_means <- means %>% unnest(mean_values)

print(unnested_means)
#-------------------------------5/23/2024---------------------------------------------------------
#Matrix calculations in R from https://ashki23.github.io/r-functions.html

M = matrix(c(4,4,-2,2,6,2,2,8,4), 3, 3)
N = matrix(c(3,2,1,0,1,-2,4,5,6), 3, 3)
b = matrix(c(0,0,1))

dim(M)
## [1] 3 3

diag(M)
## [1] 4 6 4

diag(3)
##      [,1] [,2] [,3]
## [1,]    1    0    0
## [2,]    0    1    0
## [3,]    0    0    1

Matrix::Diagonal(3, c(.1,.2,.3))
##      [,1] [,2] [,3]
## [1,]  0.1    .    .
## [2,]    .  0.2    .
## [3,]    .    .  0.3

isSymmetric(M)
## [1] FALSE

M %*% N # matrix multiplication
##      [,1] [,2] [,3]
## [1,]   18   -2   38
## [2,]   32  -10   94
## [3,]    2   -6   26

identical(M, N) #Test matrices for exact equality
## [1] FALSE

t(M) #transpose of matrix
##      [,1] [,2] [,3]
## [1,]    4    4   -2
## [2,]    2    6    2
## [3,]    2    8    4

det(M) # determinant of matrix
## [1] 8

qr(M) #QR decompostion of matrix
## $qr
##            [,1]       [,2]       [,3]
## [1,] -6.0000000 -4.6666667 -5.3333333
## [2,]  0.6666667 -4.7140452 -7.4481914
## [3,] -0.3333333  0.7071068  0.2828427
## 
## $rank
## [1] 3
## 
## $qraux
## [1] 1.6666667 1.7071068 0.2828427
## 
## $pivot
## [1] 1 2 3
## 
## attr(,"class")
## [1] "qr"

solve(M) # Inverse of M
##      [,1] [,2] [,3]
## [1,]  1.0 -0.5  0.5
## [2,] -4.0  2.5 -3.0
## [3,]  2.5 -1.5  2.0

solve(M,b) # Solve a system
##      [,1]
## [1,]  0.5
## [2,] -3.0
## [3,]  2.0

eigen(M) # spectral decompostion of matrix
## eigen() decomposition
## $values
## [1] 9.4185507 4.3878731 0.1935761
## 
## $vectors
##           [,1]       [,2]       [,3]
## [1,] 0.3994272 -0.6725085  0.1632537
## [2,] 0.8980978 -0.5844552 -0.8354557
## [3,] 0.1840605  0.4540313  0.5247494

#-----------------------------------5/24/2024-------------------------------
# split and merge data
data = expand.grid(meat = c("grade-1","grade-2","grade-3"), food = c("burger", "steak", "pizza"))
data$value = round(rnorm(nrow(data)), 2)
data
##      meat   food value
## 1 grade-1 burger  0.33
## 2 grade-2 burger -0.60
## 3 grade-3 burger  0.85
## 4 grade-1  steak  0.92
## 5 grade-2  steak  1.19
## 6 grade-3  steak  0.77
## 7 grade-1  pizza -0.60
## 8 grade-2  pizza -0.39
## 9 grade-3  pizza  0.88

data_by_food = split(data, data$food)
data_by_food
## $burger
##      meat   food value
## 1 grade-1 burger  0.33
## 2 grade-2 burger -0.60
## 3 grade-3 burger  0.85
## 
## $steak
##      meat  food value
## 4 grade-1 steak  0.92
## 5 grade-2 steak  1.19
## 6 grade-3 steak  0.77
## 
## $pizza
##      meat  food value
## 7 grade-1 pizza -0.60
## 8 grade-2 pizza -0.39
## 9 grade-3 pizza  0.88

class(data_by_food)
## [1] "list"

x = data.frame(ID = 1:6, Product = c(rep("TV", 3), rep("Mobile", 3)))
x
##   ID Product
## 1  1      TV
## 2  2      TV
## 3  3      TV
## 4  4  Mobile
## 5  5  Mobile
## 6  6  Mobile

y = data.frame(ID = c(2,4,6), Made_in = c(rep("Japan", 2), rep("China", 1)))
y
##   ID Made_in
## 1  2   Japan
## 2  4   Japan
## 3  6   China

merge(x, y, by = "ID") # Inner join
##   ID Product Made_in
## 1  2      TV   Japan
## 2  4  Mobile   Japan
## 3  6  Mobile   China

merge(x, y, by = "ID", all = TRUE) # Full outer join
##   ID Product Made_in
## 1  1      TV    <NA>
## 2  2      TV   Japan
## 3  3      TV    <NA>
## 4  4  Mobile   Japan
## 5  5  Mobile    <NA>
## 6  6  Mobile   China
#------------------------------------5/25/2024-----------------------------------
# join in R
library(dplyr)

# First data frame
df1 <- data.frame(
  id = c(1, 2, 3, 4),
  name = c("Alice", "Bob", "Charlie", "David")
)

# Second data frame
df2 <- data.frame(
  id = c(2, 3, 4, 5),
  score = c(90, 85, 88, 92)
)

#print("df1:")
print(df1)
#print("df2:")
print(df2)
# Left join
left_joined_df <- left_join(df1, df2, by = "id")

#print("Left Joined Data Frame:")
print(left_joined_df)

# Inner join
inner_joined_df <- inner_join(df1, df2, by = "id")

print("Inner Joined Data Frame:")
print(inner_joined_df)


#Example with tibble

# Create data frames
df1 <- tibble(
  id = c(1, 2, 3, 4),
  name = c("Alice", "Bob", "Charlie", "David")
)

df2 <- tibble(
  id = c(2, 3, 4, 5),
  score = c(90, 85, 88, 92)
)

# Left join
left_joined_df <- df1 %>% left_join(df2, by = "id")
#print("Left Joined Data Frame:")
print(left_joined_df)

# Inner join
inner_joined_df <- df1 %>% inner_join(df2, by = "id")
print("Inner Joined Data Frame:")
print(inner_joined_df)
