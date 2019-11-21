# House Seat Allocation based on CGP Grey Electoral College Video

You can find the basic video explaining the details [here](https://www.youtube.com/watch?v=tUX-frlNBJY) and the excellent ~40 minute explanation on the process [here](https://www.youtube.com/watch?v=6JN4RI7nkes). This project is based on the details provided in the latter video. You can get the data files used in this project from CGP Grey's [blog post](http://www.cgpgrey.com/blog/the-sneaky-plan-to-subvert-the-electoral-college).

## Project Description

This was created using [R](https://www.r-project.org/).

## Data

All data provided here as `csv` files were obtained from the CGP Grey's original spreadsheet. I cleaned the data up a little bit so that the files can be read easily.

1. `census-apportionment.csv`: Apportionment population and number of representatives by state based on the 2010 census taken on April 1, 2010. Apportionment population includes the resident population for the 50 states, as ascertained by the Twenty-Third Decennial Census under Title 13, United States Code, and counts of overseas U.S. military and federal civilian employees (and their dependents living with them) allocated to their home state, as reported by the employing federal agencies. The apportionment population excludes the population of the District of Columbia.

2. `current-population-estimate-by-state.csv`: The current estimated population by state.

3. `census-and-current-population-estimate.csv`: The census and annual estimates of the resident populations for major geographic areas and states in the United States from April 1, 2010 to July 1, 2018 released on December 2018 by U.S Census Bureau, Population Division. *Note*: The estimates are based on the 2010 Census and reflect changes to the April 1, 2010 population due to the Count Question Resolution program and geographic program revisions. See [Geographic Terms and Definitions](http://www.census.gov/programs-surveys/popest/guidance-geographies/terms-and-definitions.html) for a list of the states that are included in each region. All geographic boundaries for the 2018 population estimates series except statistical area delineations are as of January 1, 2018. For population estimates methodology statements, see [here](http://www.census.gov/programs-surveys/popest/technical-documentation/methodology.html).

4. `census-priority-values.csv`: The priority values for each state based on the 2010 census.

5. `work-check.csv`: Not sure what this is. Sneaky little table.

6. `ca-vs-and-vs-ca-percentages.csv`: Another sneaky table with percentages dangling without company. Probably used initially before creating the massive table.

7. `house-seats-table.csv`: Probably a counter for simulation. Not really of much use for simulation by code

8. `population-in-numbers-percentages-and-percentiles.csv`: This is the auxiliary table that contains population data and priority numbers. The fist two columns are percentages.

9. `house-and-electoral-college-rankings.csv`: This is the main table used for all calculations in the second spreadsheet video. The versus columns are recorded as percentages.
