library(dplyr)
library(ggplot2)
library(tidyverse)
#This is focusing on the Zillow dataset

#RStudio gave me a warning that there were thousands of parsing failures
#I don't know how this will effect the rest of the project
metro_city_data <- read_csv("Metro_time_series.csv")

cities_crosswalk <- read_csv("cities_crosswalk.csv")
glimpse(cities_crosswalk)

city_list <- c("los_angeleslos_angelesca","new_yorkqueensny","bostonsuffolkma",
               "washingtondistrict_of_columbiadc","seattlekingwa","atlantafultonga",
               "austintravistx","raleighwakenc","durhamdurhamnc","philadelphiaphiladelphiapa",
               "dallasdallastx","denverdenverco","detroitwaynemi","minneapolishennepinmn",
               "san_diegosan_diegoca","houstonharristx")

city_time_series <- read_csv("City_time_series.csv")
colnames(city_time_series)

#Trying to find what type the city_list is. Turns out its a character type
typeof(city_list)

#Now following what was recommended on the Springboard forum and just using
#filter with %in%.  I have used that before but forgot about it

#It works now hooray. 
filtered_city_list <- city_time_series %>% filter(RegionName %in% city_list)