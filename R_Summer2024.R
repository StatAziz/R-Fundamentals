
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
df %>% select(fruit)
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

#-------------------------------------------------------------------------------------------