install.packages("openxlsx")
library(dplyr)
library(ggplot2)
library(tidyverse)
library(openxlsx)
#This is focusing on the Zillow dataset

#RStudio gave me a warning that there were thousands of parsing failures
#I don't know how this will effect the rest of the project
metro_city_data <- read_csv("Metro_time_series.csv")
metro_city_data2 <- read.csv("Metro_time_series.csv")

#cities crosswalk seems to be a dictionary for the IDs for certain cities
#I will have to use this to find what the names are in the other CSV's 
cities_crosswalk <- read_csv("cities_crosswalk.csv")
glimpse(cities_crosswalk)

city_list <- c("los_angeleslos_angelesca","new_yorkqueensny","bostonsuffolkma",
               "washingtondistrict_of_columbiadc","seattlekingwa","atlantafultonga",
               "austintravistx","raleighwakenc","durhamdurhamnc","philadelphiaphiladelphiapa",
               "dallasdallastx","denverdenverco","detroitwaynemi","minneapolishennepinmn",
               "san_diegosan_diegoca","houstonharristx")

#This brings a 5x4 tibble with "bostonsuffolkma" as th eonly result 
#In Suffolk MA, the rest are in different states
cities_crosswalk %>% filter(City == "Boston")

#Turns out this is a big file, I will  probably try to filter the larger file
#and then use those results to make a more managable dataframe
city_time_series <- read_csv("City_time_series.csv")
colnames(city_time_series)

boston_time_series <-city_time_series %>% 
  filter(RegionName =="bostonsuffolkma")
#OK, so I think the Zillow data only has home price data for Boston, no
#rental data


# I need to make a function where I can have filter inside the code and 
#then pass in the vector of region names for the cities and then have
#the function go through all of the city names

#This is an attempt at a function, I will come back to it later when I 
#have found the ID's for all the cities

#city_list2 <- as.data.frame(city_list)

#function_experiment <- function(i,d){
#  for(i in 1:length(i)){
#    result <- d%>%filter(RegionName == i)
#  }
#  return(result)
#}

#filtered_list <- function_experiment(city_list2, city_time_series)

#Trying to find what type the city_list is. Turns out its a character type
typeof(city_list)
# I tried as a vector, tried as a list, both did not work. I don't know why
#city_list2 <- as.data.frame(city_list)
#typeof(city_list2)
#curious about the length of the dataframe I made.  It says the length is 1
#I don't know why, I expected 16
#length(city_list2)
#nrow(city_list2)
#Second try on function 

#function_experiment2 <- function(i,data){
#  for(i in 1:nrow(i)){
#    result <- data%>%filter(RegionName == i)
 # }
 # return(result)
#}

#filtered_list2 <- function_experiment2(i = city_list2, data =city_time_series)
#typeof(filtered_list2)

#This was an attempt I did not think would work and it did not
#filtered_list3 <- city_time_series %>% filter(RegionName == city_list)

#Now following what was recommended on the Springboard forum and just using
#filter with %in%.  I have used that before but forgot about it

#It works now hooray. 
filtered_city_list <- city_time_series %>% 
                          filter(RegionName %in% city_list)

write.csv(filtered_city_list, file = "filtered_city_time_series.csv")

#now I need to start plotting all of the cities over time.  
