library(dplyr)
library(ggplot2)
library(tidyverse)

cities <- read.csv("real_estate_db.csv")

#All of this data is just from one date, its not over time so this dataset will have
#limited use for me. 

#This works
los_angeles <- cities %>% filter(city =="Los Angeles") 

san_francisco <- cities %>% filter(city =="San Francisco")
#Instead of having a  city called "New York City" they have the individual 
#cities(? maybe neighborhoods?) inside of New York City so I am using the column 
#"place" which has results for New York City
new_york <- cities %>% filter(place == "New York City")

#Commenting out an old command that doesn't work for this dataset
#cities %>% filter(city == "New York")

chicago <-cities %>% filter(city == "Chicago")
#Need to take a closer look at the results for washington DC
#This brings the results for Washington DC but it also brings in results
#for other cities called Washington.  

#I will have to use the state_ab column and filter for DC. 
#I am commenting out the old command that does not work
#dc<- cities %>% filter(city == "Washington")
#The city is just called Washington and the state_ab is "DC"

dc <- cities %>% filter(state_ab =="DC")
cities %>% filter(city == "Seattle")


cities %>% filter(city == "Atlanta")

cities %>% filter(city == "Raleigh")

cities %>% filter(city == "Durham")

cities %>% filter(city == "Austin")

cities %>% filter(city == "Philadelphia")
 
cities %>% filter(city == "Dallas")
 
cities %>% filter(city == "Denver")
 
cities %>% filter(city == "Detroit")

cities %>% filter(city == "Minneapolis")

st_paul <- cities %>% filter(city == "Saint Paul")
 
cities %>% filter(city == "Paul")

#REsult Also has no results, which makes sense given how Silicon Valley
#Is a part of San Francisco.  
cities %>% filter(city == "Silicon Valley")


#Result "san_diegosan_diegoca"
cities %>% filter(city == "San Diego")
#Result "houstonharristx"
cities %>% filter(city == "Houston")

#So I can use the city list in filter %in% for all cities except New York City
#For that I will filter for New York City in the area column in a seperate 
#command and then append that to the dataframe I made with the other cities
#also have to do this with Washington DC

#Turns out append does not work with dataframes, I have to use rbind(), 
#forgot about that for a moment

city_list <- c("San Francisco","Boston", "Chicago","Los Angeles", "Washington",
               "Seattle","Atlanta", "Austin", "Raleigh", "Durham", "Philadelphia",
               "Dallas", "Denver", "Detroit", "Minneapolis", "Saint Paul", "San Diego",
               "Houston")

state_list <- c("CA", "MA", "IL", "CA", "DC", "WA", "GA", "TX", "NC", "NC", 
                "PA", "TX", "CO", "MI", "MN", "MN", "CA", "TX")

#mentor session function, create a vector for states and a vector for cities
#   filter_city <- function(df, states, cities) {
 # res <- df %>% 
 #   filter(city %in% cities, state %in%states)
  
 # return(res)
#   }
city_list <- as.list(city_list)
state_list <- as.list(state_list)
city_list_matrix <- matrix(city_list, nrow = 18, byrow = TRUE)
state_list_matrix <- matrix(state_list, nrow = 18, byrow = TRUE)
city_and_state_matrix<-cbind(city_list_matrix, state_list_matrix)
city_and_state_df <- data.frame(city_and_state_matrix)

filter_city <- function(df, states, cities) {
   res <- df %>% 
    filter(cities %in% city, state %in%state_ab)
  
   return(res)
}

filter_city(df = cities, states = state_list, cities = city_list)

#I ended up reversing the  order of what goes before %in% and what goes after
#I keep thinking that the smaller one goes inside the larger one when its the opposite

filtered_df <- cities %>% filter(city%in% city_list & state_ab %in% state_list)

#Because the New York one is structured differently then the others I need to make a new
#df and then rbind that to the filtered_df

new_york<- cities %>% filter(place =="New York City")

filtered_df2 <- filtered_df %>% rbind(new_york)