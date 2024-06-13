
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
#---------------------------------5/26/2024-------------------------------------
# difference between data.frame() and tibble() 
# 
# data.frame() and tibble() are both functions in R for creating data frames,
# but they have some differences in terms of functionality and behavior. data.frame() 
# is a base R function, while tibble() is part of the tibble package, 
# which is part of the tidyverse suite of packages. Here are the key differences:

# data.frame(): By default, it prints the entire data frame.
# tibble(): Prints a more compact and readable version of the data frame, 
# showing only the first 10 rows and the columns 
# that fit on the screen. This can be very helpful for large data frames.


#printing
df <- data.frame(x = 1:20, y = rnorm(20))
print(df)

library(tidyverse)
tb <- tibble(x = 1:20, y = rnorm(20))
print(tb)

#Subsetting
# data.frame
df <- data.frame(x = 1:3, y = 4:6)
print(df$x)  # Returns a vector

# tibble
tb <- tibble(x = 1:3, y = 4:6)
print(tb$x)  # Returns a tibble

# Column Data Types
# data.frame(): Converts character vectors to factors by default.
# tibble(): Keeps character vectors as character vectors.

df <- data.frame(x = c("a", "b", "c"))
str(df)  # x is a factor

tb <- tibble(x = c("a", "b", "c"))
str(tb)  # x is a character vector

# Handling Non-Syntactic Names
# data.frame(): Automatically converts non-syntactic names to syntactic names.
# tibble(): Allows non-syntactic names (e.g., names with spaces or special characters)
# but you need to use backticks to refer to them.

df <- data.frame(`a b` = 1:3)
print(names(df))  # Converts to syntactic names

tb <- tibble(`a b` = 1:3)
print(names(tb))  # Keeps non-syntactic names
print(tb$`a b`)  # Access using backticks

#--------------------------------5/27/2024------------------------------
# Monte Carlo simulation to estimate the value of π

# Number of random points to generate
n <- 10000

# Generate random points (x, y) in the unit square [0, 1] x [0, 1]
x <- runif(n)
y <- runif(n)

# Calculate the distance of each point from the origin (0, 0)
distance <- sqrt(x^2 + y^2)

# Count the number of points inside the quarter circle (distance <= 1)
inside_circle <- sum(distance <= 1)

# Estimate the value of π
# np= number of points
# ratio of np in quarter circle to np of unit square = ratio of area of quarter circle to area unit area
# inside_circle/ n = (pi/4)/1
pi_estimate <- (inside_circle / n) * 4
 
# Print the estimated value of π
print(paste("Estimated value of π:", pi_estimate))

# Optional: visualize the points and the quarter circle
plot(x, y, col = ifelse(distance <= 1, "blue", "yellow"), asp = 1,
     main = paste("Monte Carlo Simulation (n =", n, ")"),
     xlab = "x", ylab = "y")
#symbols(0, 0, circles = 1, add = TRUE, inches = FALSE, border = "red")
library(plotrix)
draw.circle(0, 0, 1, border = "green")

#-------------------------------5/28/2024---------------------------------------------------
# draw different shapes

#triangle

x<- c(0, 1, 0.5) #ordering of coordinates does not matter for triangle
y<- c(0, 0, 1)
plot(x,y)
polygon(x,y)

x<- c(0, .5, 1)
y<- c(0, 1, 0)
plot(x,y)
polygon(x,y)


#tetragon
# sequence of coordinates matter here
x<- c(1, 1, 2, 2) #ordering of coordinates does not create close shape here
y<- c(0, 1, 0, 1)
plot(x,y)
polygon(x,y)


x<- c(1, 2, 2, 1) # here the ordering or sequence of coordinates create close shape
y<- c(0, 0, 1, 1)
plot(x,y)
polygon(x,y)

#---------------------5/29/2024-----------------------------------------
# draw a line
x<- c(2,0)
y<- c(4,5)
plot(x,y)
polygon(x,y)

#draw a circle
symbols(0,0,.75, inches = FALSE) # without inches = False the circles will be same size.
symbols(0,0,.5, inches = FALSE)



#-------------------------------5/30/2024-----------------------------------
#draw a cube

# Install and load the rgl package
if (!require("rgl")) {
  install.packages("rgl")
  library(rgl)
}

# Define the vertices of a cube
vertices <- rbind(
  c(0, 0, 0),
  c(1, 0, 0),
  c(1, 1, 0),
  c(0, 1, 0),
  c(0, 0, 1),
  c(1, 0, 1),
  c(1, 1, 1),
  c(0, 1, 1)
)

# Define the edges of the cube
edges <- rbind(
  c(1, 2), c(2, 3), c(3, 4), c(4, 1), # bottom square
  c(5, 6), c(6, 7), c(7, 8), c(8, 5), # top square
  c(1, 5), c(2, 6), c(3, 7), c(4, 8)  # vertical edges
)

# Plot the cube
open3d()
plot3d(vertices, type = "s", size = 0.1, xlab = "X", ylab = "Y", zlab = "Z")
for (i in 1:nrow(edges)) {
  segments3d(rbind(vertices[edges[i, 1], ], vertices[edges[i, 2], ]), col = "blue")
}
#----------------------------5/31/2024---------------------------------------------------------------

#datetime object in R

# Create a Date object
my_date <- as.Date("2024-05-25")
print(my_date)

# Create a POSIXct object
my_datetime <- as.POSIXct("2024-05-25 12:34:56")
print(my_datetime)

# Create a POSIXlt object
my_datetime_lt <- as.POSIXlt("2024-05-25 12:34:56")
print(my_datetime_lt)


print(my_datetime_lt$sec)   # seconds
print(my_datetime_lt$min)   # minutes
print(my_datetime_lt$hour)  # hours
print(my_datetime_lt$mday)  # day of the month
print(my_datetime_lt$mon)   # months since January (0-11)
print(my_datetime_lt$year)  # years since 1900
print(my_datetime_lt$wday)  # day of the week (0-6, Sunday is 0)
print(my_datetime_lt$yday)  # day of the year (0-365)
print(my_datetime_lt$isdst)
#---------------------------6/1/2024-------------------------------------
#use of Lubridate

# Install and load the lubridate package
if (!require("lubridate")) {
  install.packages("lubridate")
  library(lubridate)
}

# Parse a date-time string
my_datetime <- ymd_hms("2024-05-25 12:34:56")
print(my_datetime)

# Extract components
year <- year(my_datetime)
month <- month(my_datetime)
day <- day(my_datetime)
hour <- hour(my_datetime)
minute <- minute(my_datetime)
second <- second(my_datetime)

print(paste("Year:", year))
print(paste("Month:", month))
print(paste("Day:", day))
print(paste("Hour:", hour))
print(paste("Minute:", minute))
print(paste("Second:", second))

#-------------------------------------------2/6/2024---------------------------
#while loop in R
#basic structure
while (condition) {
  # Code to execute
}

# Initialize a counter variable
counter <- 1

# Start the while loop
while (counter <= 5) {
  # Print the current value of the counter
  print(counter)
  
  # Increment the counter by 1
  counter <- counter + 1
}
# Initialize a counter variable
counter <- 1

# Start the while loop
while (TRUE) {
  # Print the current value of the counter
  print(counter)
  
  # Increment the counter by 1
  counter <- counter + 1
  
  # Break the loop if counter exceeds 5
  if (counter > 5) {
    break
  }
}
# Initialize a counter variable
counter <- 1

# Start the while loop
while (counter <= 5) {
  # Skip even numbers
  if (counter %% 2 == 0) {
    counter <- counter + 1
    next
  }
  
  # Print the current value of the counter
  print(counter)
  
  # Increment the counter by 1
  counter <- counter + 1
}
#---------------------------------------------3/6/2024-------------------------------
#binary search in R

# Binary search function
binary_search <- function(vec, target) {
  left <- 1
  right <- length(vec)
  
  while (left <= right) {
    mid <- floor((left + right) / 2)
    
    if (vec[mid] == target) {
      return(mid)  # Target found, return its index
    } else if (vec[mid] < target) {
      left <- mid + 1  # Narrow search to upper half
    } else {
      right <- mid - 1  # Narrow search to lower half
    }
  }
  
  return(-1)  # Target not found
}


# Sorted vector
sorted_vec <- c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19)

# Target value to search
target_value <- 7

# Perform binary search
result <- binary_search(sorted_vec, target_value)

# Print result
if (result != -1) {
  print(paste("Target found at index:", result))
} else {
  print("Target not found")
}


#-----------------------------------------------6/4/2024---------------------
# linear search in R

# Define the linear search function
linear_search <- function(vec, target) {
  for (i in seq_along(vec)) {
    if (vec[i] == target) {
      return(i)  # Return the index of the target value
    }
  }
  return(-1)  # Return -1 if the target value is not found
}

# Example usage
sample_vector <- c(10, 20, 30, 40, 50)
target_value <- 30

# Call the linear search function
result <- linear_search(sample_vector, target_value)

# Print the result
if (result != -1) {
  cat("Target value", target_value, "found at index", result, "\n")
} else {
  cat("Target value", target_value, "not found in the vector\n")
}

#--------------------------6/5/2024--------------------------------------
#DSA algorithm
# Bubble sort algoritm

# Define the Bubble Sort function
bubble_sort <- function(vec) {
  n <- length(vec)
  for (i in 1:(n-1)) {
    for (j in 1:(n-i)) {
      if (vec[j] > vec[j+1]) {
        # Swap elements if they are in the wrong order
        temp <- vec[j]
        vec[j] <- vec[j+1]
        vec[j+1] <- temp
      }
    }
  }
  return(vec)
}

# Example usage
unsorted_vector <- c(64, 34, 25, 12, 22, 11, 90)
sorted_vector <- bubble_sort(unsorted_vector)

# Print the result
cat("Unsorted vector: ", unsorted_vector, "\n")
cat("Sorted vector: ", sorted_vector, "\n")
#-------------------------------------6/6/2024----------------------------------

#object oriented programming

## 1.Define the construction function
# Constructor function for BankAccount class
BankAccount <- function(owner, balance = 0) {
  account <- list(owner = owner, balance = balance)
  class(account) <- "BankAccount"
  return(account)
}

##2.Define Methods
# Method to deposit money
deposit <- function(account, amount) {
  UseMethod("deposit", account)
}

# Specific method for BankAccount class
deposit.BankAccount <- function(account, amount) {
  account$balance <- account$balance + amount
  return(account)
}

# Method to withdraw money
withdraw <- function(account, amount) {
  UseMethod("withdraw", account)
}

# Specific method for BankAccount class
withdraw.BankAccount <- function(account, amount) {
  if (amount > account$balance) {
    stop("Insufficient funds")
  }
  account$balance <- account$balance - amount
  return(account)
}

# Method to print account details
print.BankAccount <- function(account) {
  cat("Account owner:", account$owner, "\n")
  cat("Account balance:", account$balance, "\n")
}

##3.Example Usage
# Create a new bank account
my_account <- BankAccount("John Doe", 100)

# Print account details
print(my_account)

# Deposit money
my_account <- deposit(my_account, 50)
print(my_account)

# Withdraw money
my_account <- withdraw(my_account, 30)
print(my_account)
#----------------------------
# Attempt to withdraw more than the balance
# my_account <- withdraw(my_account, 150)  # This will raise an error


#--------------------------------6-7-2024---------------------

#Support Vector Machine
# Install and load required package
install.packages("e1071")
library(e1071)

# Load the Iris dataset
data(iris)

# Subset the data to include only setosa and versicolor species
iris_subset <- subset(iris, Species != "virginica")
# Convert Species to a factor with levels setosa and versicolor
iris_subset$Species <- factor(iris_subset$Species, levels = c("setosa", "versicolor"))

# Train-test split
set.seed(123)
train_indices <- sample(1:nrow(iris_subset), 0.7 * nrow(iris_subset))
train_data <- iris_subset[train_indices, ]
test_data <- iris_subset[-train_indices, ]

# Train the SVM model
svm_model <- svm(Species ~ ., data = train_data, kernel = "linear", cost = 1)
print(svm_model)

# Make predictions
predictions <- predict(svm_model, test_data)

# Evaluate the model
confusion_matrix <- table(Predicted = predictions, Actual = test_data$Species)
print(confusion_matrix)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy:", round(accuracy, 2)))


# Visualization 

# Plotting the data
plot(iris_subset[, 1:2], col = as.integer(iris_subset$Species), pch = 19)
points(test_data[, 1:2], col = as.integer(predictions), pch = 4)

# Add decision boundary
make.grid <- function(x, n = 100) {
  grange <- apply(x, 2, range)
  x1 <- seq(from = grange[1, 1], to = grange[2, 1], length = n)
  x2 <- seq(from = grange[1, 2], to = grange[2, 2], length = n)
  expand.grid(Sepal.Length = x1, Sepal.Width = x2)
}

# Generate grid points
grid <- make.grid(train_data[, 1:2])
grid_pred <- predict(svm_model, grid)

# Plot the decision boundary
contour(unique(grid$Sepal.Length), unique(grid$Sepal.Width), 
        matrix(as.numeric(grid_pred), length(unique(grid$Sepal.Length)), 
               length(unique(grid$Sepal.Width))), add = TRUE, drawlabels = FALSE)

#----------------------------------------------------6/8/2024------------------

#image classification
# Install and Load Required Packages

install.packages("keras")
library(keras)

# Prepare the Data
#install tensorflow

# Install the tensorflow package
install.packages("tensorflow")

# Load the tensorflow package
library(tensorflow)

# Install TensorFlow
install_tensorflow()

library(tensorflow)

# Verify TensorFlow installation
tf$constant("Hello, TensorFlow!")

library(keras)
# Install and load required packages
install.packages("keras")
library(keras)

# Load the MNIST dataset
mnist <- dataset_mnist()
c(x_train, y_train) %<-% mnist$train
c(x_test, y_test) %<-% mnist$test

# Normalize the images to values between 0 and 1
x_train <- x_train / 255
x_test <- x_test / 255

# Reshape the data to fit the model: [number of samples, image width, image height, number of channels]
x_train <- array_reshape(x_train, c(nrow(x_train), 28, 28, 1))
x_test <- array_reshape(x_test, c(nrow(x_test), 28, 28, 1))

# Convert class vectors to binary class matrices (one-hot encoding)
y_train <- to_categorical(y_train, 10)
y_test <- to_categorical(y_test, 10)

# Define the model
model <- keras_model_sequential() %>%
  layer_conv_2d(filters = 32, kernel_size = c(3, 3), padding = "same", input_shape = c(28, 28, 1)) %>%
  layer_activation("relu") %>%
  layer_conv_2d(filters = 32, kernel_size = c(3, 3)) %>%
  layer_activation("relu") %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>%
  layer_dropout(0.25) %>%
  layer_conv_2d(filters = 64, kernel_size = c(3, 3), padding = "same") %>%
  layer_activation("relu") %>%
  layer_conv_2d(filters = 64, kernel_size = c(3, 3)) %>%
  layer_activation("relu") %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>%
  layer_dropout(0.25) %>%
  layer_flatten() %>%
  layer_dense(units = 512) %>%
  layer_activation("relu") %>%
  layer_dropout(0.5) %>%
  layer_dense(units = 10) %>%
  layer_activation("softmax")

#------------------------------6/9/2024----------------------


# Install and load the caret package
install.packages("caret")
library(caret)

# Load the iris dataset
data(iris)

# Define the control using a 5-fold cross-validation
train_control <- trainControl(method = "cv", number = 5)

# Train the model
model <- train(Species ~ ., data = iris, method = "rpart",
               trControl = train_control)

# Print the results
print(model)
#-----------------------------------6/10/2024----------------------
# Hierarchical Clustering
# Load the iris dataset
data(iris)

# Remove the species column for clustering
iris_data <- iris[, -5]

# Compute the distance matrix
distance_matrix <- dist(iris_data, method = "euclidean")

# Perform hierarchical clustering
hc <- hclust(distance_matrix, method = "ward.D2")

# Plot the dendrogram
plot(hc, labels = iris$Species, main = "Hierarchical Clustering Dendrogram")

# Cut the dendrogram into 3 clusters
clusters <- cutree(hc, k = 3)

# Add the clusters to the original data
iris$Cluster <- as.factor(clusters)

# Plot the clusters
library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color = Cluster)) +
  geom_point() +
  labs(title = "Hierarchical Clustering of Iris Data")
#---------------------------6/11/2024----------------------------
# K-means clustering

# Load the iris dataset
data(iris)

# Remove the species column for clustering
iris_data <- iris[, -5]

# Perform k-means clustering with 3 clusters
set.seed(123)  # Set seed for reproducibility
kmeans_result <- kmeans(iris_data, centers = 3, nstart = 25)

# Add the cluster results to the original data
iris$Cluster <- as.factor(kmeans_result$cluster)

# Plot the clusters
library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color = Cluster)) +
  geom_point() +
  labs(title = "K-Means Clustering of Iris Data")
#--------------------------6/12/2024----------------------------------

# web scrapping

# Install and load the required packages
install.packages("rvest")
install.packages("dplyr")
library(rvest)
library(dplyr)

# Specify the URL of the web page to scrape
url <- "http://books.toscrape.com/"

# Read the content of the web page
webpage <- read_html(url)

# Extract the titles of the books
titles <- webpage %>%
  html_nodes(".product_pod h3 a") %>%
  html_attr("title")

# Extract the prices of the books
prices <- webpage %>%
  html_nodes(".price_color") %>%
  html_text()

# Clean the prices to remove the currency symbol and convert to numeric
prices <- gsub("£", "", prices) %>%
  as.numeric()

# Combine the titles and prices into a data frame
books <- data.frame(
  Title = titles,
  Price = prices
)

# Print the first few rows of the data frame
print(head(books))
#------------------------------------6/13/2024----------------------------
