library(dplyr)
library(ggplot2)
library(tidyverse)

cities <- read_csv("cities_crosswalk.csv")

cities %>% filter(City == "Los Angeles")
#Results, Row 8047 "los_angeleslos_angelesca", 
#Row 4633 "east_los_angeleslos_angelesca", I would not have found the 
#East LA thing if I had not hit ctrl+f in the Excel document.

#I don't
#know how to make a function that is more efficient then this because both
#will involve me writing down all of the city names at some point. 

cities %>% filter(City == "San Francisco")
#Result Row 24706: "san_franciscosan_franciscoca"

#This brings up nothing
cities %>% filter(City == "New York City")
#This has 4 results with the useful one being "new_yorkqueensny"
cities %>% filter(City == "New York")

cities %>% filter(City == "Chicago")
#Finding DC might be tricky, at least in R. In Excel I typed "district of columbia"
#into the search bar and found it on 
#row 9953 "washingtondistrict_of_columbiadc"
cities %>% filter(City == "Washington")

#"seattlekingwa"
cities %>% filter(City == "Seattle")

#"atlantafultonga"
cities %>% filter(City == "Atlanta")
#Raleigh-Durham is another interesting case.  There is no city named
#Raleigh-Durham in the dataset so I will search for Raleigh and Durham 
#As seperate cities and see what happens. 
#Result for Raleigh Row 20350 "raleighwakenc"
cities %>% filter(City == "Raleigh")
#Result "durhamdurhamnc"
cities %>% filter(City == "Durham")
#Result "austintravistx"
cities %>% filter(City == "Austin", State =="TX")
#Result "philadelphiaphiladelphiapa"   ...wtf?
cities %>% filter(City == "Philadelphia")
# Result "dallasdallastx" 
cities %>% filter(City == "Dallas")
# Result "denverdenverco"
cities %>% filter(City == "Denver")
#Result "detroitwaynemi"
cities %>% filter(City == "Detroit")
#Result "minneapolishennepinmn"
cities %>% filter(City == "Minneapolis")
#Result  None from this one. Have to try again using something else
cities %>% filter(City == "St. Paul")
#Also does not work. St. Paul is part of the "Twin Cities" with Minneapolis
#Maybe there is something there with how Zillow has its data
cities %>% filter(City == "Paul")

#REsult Also has no results, which makes sense given how Silicon Valley
#Is a part of San Francisco.  
cities %>% filter(City == "Silicon Valley")


#Result "san_diegosan_diegoca"
cities %>% filter(City == "San Diego")
#Result "houstonharristx"
cities %>% filter(City == "Houston")
