#################################################
##
##  STA 308 Take-Home Final in R
##
##  Anna Ochsenhirt, Dec. 13 2023
##
##
##  Goal is to create a table that computes the 
##    mean state percentage decrease in the 
##    flu-pneumonia mortality rates from 2018 
##    to 2021 in each of the four specified census
##    regions, along with each of the related
##    standard deviations and coefficients of variation.
##
##  Alaska and Hawaii will not be included in any
##    of the regions for this analysis.
##
##
##


## First I want to load in the tidyverse package and read in and label all appropriate csv files
library(tidyverse)

mort_rates2018 <- read.csv("https://tjfisher19.github.io/data/fluPneumonia_2018.csv")

mort_rates2021 <- read.csv("https://tjfisher19.github.io/data/fluPneumonia_2021.csv")

state_abrv <- read.csv("https://tjfisher19.github.io/data/state_abb_codes.csv")

census_regions <- read.csv("https://tjfisher19.github.io/data/censusRegions.csv")


## Now I will merge each of the csv files and filter out Alaska and Hawaii
census_codes <- merge(census_regions, state_abrv, 
                      by.x = "State", by.y = "Code")
print(census_codes) # double check it looks right

## Create 2018 table with appropriate State labels
census2018 <- merge(mort_rates2018, census_codes,
                    by = "State") %>%
  mutate(Rate2018 = Rate,
  ) %>%
  filter(!State %in% c("AK", "HI")) %>%
  group_by(Region) %>%
  select(Region, State, State.y, Rate2018)
print(census2018) # double check it looks right

## Create 2021 table with appropriate labels
census2021 <- merge(mort_rates2021, census_codes, 
                    by.x = "State", by.y = "State.y") %>%
  mutate(Rate2021 = Rate,
         State = State.y,
         States = State) %>%
  filter(!State.y %in% c("AK", "HI")) %>%
  group_by(Region) %>%
  select(Region, State.y, State, Rate2021)
print(census2021) # double check it looks right

## Merge both mortality rates into one table

census_years <- merge(census2018, census2021,
                      by = "State") %>%
  mutate(Region = Region.x) %>%
  group_by(Region) %>%
  select(Region, State, Rate2018, Rate2021)
print(census_years) ## double check it looks right

## Create the Percent Change column
census_years <- census_years %>%
  mutate(PctDec = ( (Rate2018 - Rate2021)/Rate2018*100))
print(census_years) # double check look

results <- census_years %>%
  group_by(Region) %>%
  summarise(Mean = mean(PctDec),
            SD = sd(PctDec), 
            CV = sd(PctDec) / mean(PctDec))

print(results)
