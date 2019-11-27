# load a collection of libraries for data analysis and visualization
library(tidyverse)

# load libraries for colors and themes
library(viridis)
library(hrbrthemes)

# load library containing all the map data
library(maps)
library(usmap)

# load libraries to create interactive html plots
library(plotly)
library(htmlwidgets)

# Load existing data set created by CGP Grey
# This loads the data based on file path and should work on any platform
# Change folder and file names accordingly if the data is changed
data_folder <- file.path(dirname(getwd()), "data")
house_rankings_data <- file.path(data_folder, "house-rankings.csv")
house_rankings <- read.csv(file = house_rankings_data, header = TRUE)

# Add the row names of the data to be the same as each state
rownames(house_rankings) <- house_rankings$State

# Create a separate data frame that contains only the relevant data
state_rankings <- data.frame(state = house_rankings$State,
                             region = tolower(house_rankings$State),
                             house_seats = house_rankings$House.Seats,
                             ec_seats = house_rankings$Electoral.College,
                             census = house_rankings$Census.Population)

# Specify the rownames of this data frame to the state
rownames(state_rankings) <- tolower(state_rankings$state)

# Add a column for displaying information in a tooltip
state_rankings <- state_rankings %>%
    mutate(tooltip_text = paste("State: ", state,
                                "\nPopulation (2010): ", census,
                                "\nHouse seats: ", house_seats,
                                "\nElectoral College seats: ", ec_seats,
                                sep = ""))

# Calculate the representation of a state in the house and electoral college
# This is done by dividing the census population by the current seats
state_rankings$house_representation <- (state_rankings$census /
                                        state_rankings$house_seats)
state_rankings$ec_representation <- (state_rankings$census /
                                     state_rankings$ec_seats)

# Load the US mainland map data
mainland_map <- map_data("state")

# Merge the two data frames based on region
mainland_rankings <- merge(mainland_map, state_rankings,
                           sort = FALSE, by = "region")

# Order the data based on their population
mainland_rankings <- mainland_rankings[order(mainland_rankings$census), ]

# Plot the population map of the mainland US
mainland_pop_plot <- ggplot(mainland_rankings,
                            aes(x = long, y = lat)) +
                       geom_polygon(aes(group = group, fill = census)) +
                       coord_map("albers",  at0 = 45.5, lat1 = 29.5)
mainland_pop_html <- ggplotly(mainland_pop_plot, tooltip = tooltip_text)
saveWidget(mainland_pop_html,
           file=paste0(getwd(), "/html/mainland_population.html"))
