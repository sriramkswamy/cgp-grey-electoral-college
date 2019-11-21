# load some useful libraries for data analysis
library(tidyverse)

# information about the data folders
data_folder <- file.path(dirname(getwd()), "data")
current_population_data <- file.path(data_folder,
                                     "current-population-estimate.csv")
census_population_data <- file.path(data_folder,
                                    "census-population-estimate.csv")
census_priority_data <- file.path(data_folder, "census-priority-values.csv")
census_apportionment_data <- file.path(data_folder, "census-apportionment.csv")
house_rankings_data <- file.path(data_folder, "house-rankings.csv")
house_seats_data <- file.path(data_folder, "house-seats-table.csv")
population_percentile_data <- file.path(data_folder,
                                        "population-percentiles.csv")

# load all the data into different data frames
current_population <- read.csv(current_population_data)
census_population <- read.csv(census_population_data)
census_priority <- read.csv(census_priority_data)
census_apportionment <- read.csv(census_apportionment_data)
house_rankings <- read.csv(house_rankings_data)

# All of this data set is organized by state and, sometimes, geographic region
# use that as their row names except for census priority since row names have
# to be unique
rownames(current_population) <- current_population$State
rownames(census_population) <- census_population$Geographic.Area
rownames(census_apportionment) <- census_apportionment$State
rownames(house_rankings) <- house_rankings$State
