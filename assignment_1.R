#####-----Title------####
# Introduction to R - Assignment 1



#####-----Q1------####

mtcars <- get(data("mtcars"))

car_countries <- c("Japan", "Japan", "Japan", "USA", "USA",
                   "USA", "USA", "Germany", "Germany", "Germany", "Germany",
                   "Germany", "Germany", "Germany", "USA",
                   "USA", "USA", "Italy", "Japan",
                   "Japan", "Japan", "USA", "USA",
                   "USA", "USA", "Italy", "Germany", "UK",
                   "USA", "Italy", "Italy", "Sweden")


mtcars$car_countries <- car_countries

mean_mpg <- mean(mtcars[,1])

car_mpgs <- mtcars[,1]

car_names <- rownames(mtcars)

temp_below <- vector()
temp_above <- vector()

for(i in 1:length(car_mpgs)){
  if(car_mpgs[i] < mean_mpg){
    temp_below <- append(temp_below, car_names[i]);
  }
  else if(car_mpgs[i] > mean_mpg){
    temp_above <- append(temp_above, car_names[i]);
  }
}

below_average <- temp_below
above_average <- temp_above

#####-----Q2------####

USA_cars <- data.frame()
Japan_cars <- data.frame()

for(i in 1:nrow(mtcars)){
  
  car <- mtcars[i,]
  
  if(car$car_countries == "USA"){
    USA_cars <- rbind(USA_cars,car)
  }
  
  else if(car$car_countries == "Japan"){
    Japan_cars <- rbind(Japan_cars,car)
  }

}

#####-----Q3------####

mpg_per_cyl_USA <- mean(USA_cars$mpg / USA_cars$cyl)
mpg_per_cyl_Japan <- mean(Japan_cars$mpg / Japan_cars$cyl) 

#####-----Q4------####


#install.packages('billboard') 

#You need to run the install only once.
# Comment it out by removing the #, then comment it out again 

library(billboard)
spotify_track_data <-  get(data("spotify_track_data"))
print(head(spotify_track_data))
dim(spotify_track_data)

my_playlist <- data.frame()

for(i in 1:nrow(spotify_track_data)){
  track <- spotify_track_data[i,]
  if(track$artist_name == "Rihanna" 
     | track$artist_name == "Michael Jackson" 
     | track$artist_name == "Elvis Presley" 
     | track$artist_name == "Eminem"){
    
    my_playlist <- rbind(my_playlist, track)
  }
}

#####-----Q5------####

dance_tracks <- data.frame();

danceability_median <- median(my_playlist$danceability)

for(i in 1:nrow(my_playlist)){
  track <- my_playlist[i,]
  
  if(track$danceability > danceability_median){
    dance_tracks <- rbind(dance_tracks,track)
  }
}

#####-----Q6------####

Rihanna_dance_tracks <- nrow(dance_tracks[dance_tracks$artist_name == "Rihanna",]) / nrow(my_playlist)

#####-----Q7------####

# Note: Do not alter the original spotify_track_data dataset!
# You should alter only the corrected_playlist dataset.

corrected_playlist <- spotify_track_data


for(i in 1:nrow(corrected_playlist)){
  track <- corrected_playlist[i,]
  
  if(track$artist_name == "Michael Jackson"){
    
    corrected_playlist[i,"danceability"] <- track$danceability - 0.05
    
  }
}


