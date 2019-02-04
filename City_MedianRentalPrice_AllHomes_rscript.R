library(dplyr)
library(ggplot2)
library(tidyverse)
install.packages("xts")
library(xts)
full_rent_df <- read_csv("City_MedianRentalPrice_AllHomes.csv")


new_york_rent <- full_rent_df %>% filter(grepl("New York", full_rent_df$Metro))
# The function below this line only returns one value...wtf?
#new_york_rent <- full_rent_df %>% filter(RegionName =="New York")

city_list <- c("San Francisco","Boston", "Chicago","Los Angeles", "Washington",
               "Seattle","Atlanta", "Austin", "Raleigh", "Durham", "Philadelphia",
               "Dallas", "Denver", "Detroit", "Minneapolis", "Saint Paul", "San Diego",
               "Houston")
#This creates a small tibble of median rent over 20 cities. There are 3 cities with 
#Washington in the title but luckily they are the last two rows in the tibble
rent_tibble <- full_rent_df %>% filter(RegionName  %in% city_list)
#removing last 2 rows in the tibble
rent_tibble <- rent_tibble[1:18, ]
#attaching the values associated with New York metro area
rent_tibble2 <- rent_tibble %>% rbind(new_york_rent)
#transposing the data so the dates are the individual rows
rent_tibble3<- t(rent_tibble2)
#changing the column names to the first row of the new tibble, still now entirely sure
#what the difference between a dataframe and a tibble is. I'm sure I've seen it in a 
#datacamp course I just can't remember it
colnames(rent_tibble3) = rent_tibble3[1,]
#removing the first row due to it being redundant
rent_tibble3 <- rent_tibble3[-1,]
#removing the first four rows so all I am left with is numbers
rent_tibble4 <- rent_tibble3[-c(1,2,3,4), ]

rent_df <- as.data.frame(rent_tibble4)
#running into a lot of problems trying to graph the time series charts.  
ggplot(data = rent_df, aes(y = chicago)) + geom_point()
#Getting the error x must be a numberic vetor or matrix, going to try to amke a matrix
#and then see what happens
dotchart(x = rent_df)
options(digits = 15)
#I can't figure out a way to get as.numeric to stop chopping off zeroes. It's rather
#frustrating. 
chicago_matrix <- as.numeric(rent_df$Chicago, digits = 8)

plot(chicago_matrix)
plot(as.xts(rent_df$Chicago))
chicago_no_na <- na.omit(rent_df[,1:18]) 
plot.xts(chicago_no_na, y = chicago)
typeof(rent_df$Chicago)
