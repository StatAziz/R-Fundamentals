
# ----- 05/12/2024------------------------------------------------------------------------------
fruit<- c("apple", "banana","lemon")
price<- c(10, 20, 30)
df<- data.frame(fruit, price) # okay
df<- data.frame(c(fruit, price)) # it gives one column
str(df)
df[1,2]
df[1,]
df[,1]
df$fruit[2]
mean(df$price[2:3])

#pipe
library(dplyr)
df %>% select(fruit)
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
# ---------------------------------------------------------------------------------------------