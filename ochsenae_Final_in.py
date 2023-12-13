# -*- coding: utf-8 -*-
"""
Created on Mon Dec 11 12:19:08 2023

@author: aeoch

 The Goal of this code is to create a table that 
   computes the mean state percentage decrease in the 
   flu-pneumonia mortality rates from 2018 to 2021 in 
   each of the four specified census regions, along 
   with each of the related standard deviations and 
   coefficients of variation.
"""
###########################
## First, we fetch the pneumonia 
##  mortality rates for 2018 and 
##  2021, state codes, and census
##  region data.
##

import pandas as pd

mort_rates2018 = pd.read_csv("https://tjfisher19.github.io/data/fluPneumonia_2018.csv")

mort_rates2021 = pd.read_csv("https://tjfisher19.github.io/data/fluPneumonia_2021.csv")

state_abrv = pd.read_csv("https://tjfisher19.github.io/data/state_abb_codes.csv")

census_regions = pd.read_csv("https://tjfisher19.github.io/data/censusRegions.csv")

############################
## I'll merge each of the csv files 
##  to fit the appropriate state 
##  labels and filter out Alaska and 
##  Hawaii


## Create merged 2018 DataFrame with approriate columns
census2018 = mort_rates2018.merge(census_regions, on='State') \
    [(mort_rates2018.State !="AK") & (mort_rates2018.State != "HI")]
    # change column name to easily merge 2018 and 2021 dataframes
census2018.rename(columns={"State": "Code"}, inplace=True) 
census2018.head() # checking it looks right

## Create merged 2021 data frame with approriate columns
census2021 = mort_rates2021.merge(state_abrv, on='State') \
    [(mort_rates2021.State !="Alaska") & (mort_rates2021.State != "Hawaii")]
census2021.head() # checking it looks right

## Now merge both mortality rate DataFrames together
census_years = census2018.merge(census2021, on='Code')
census_years.head() # checking it looks right
    # Rename Column titles to better fit data for readability
census_years.rename(columns={"Rate_x": "Rate2018", "Rate_y": "Rate2021"}, inplace=True)
census_years.head() # checking it looks right


## Create new column for Percent Decrease in state mortality within new 'results' DataFrame

results = census_years.assign(PctDec = ( (census_years['Rate2018'] - census_years['Rate2021'])/census_years['Rate2018']*100)). \
    groupby("Region"). \
    agg(Mean=('PctDec', 'mean'), SD=('PctDec', 'std'), CV=('PctDec', lambda x: x.std() / x.mean()))
    

print(results)
 
