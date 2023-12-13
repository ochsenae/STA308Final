# STA308_Final
### Author: Anna Ochsenhirt

##Data analysis in both R and Python

## Calculated values from both R and Python code

| Region    | Mean      | SD        | CV       |
|-----------|-----------|-----------|----------|
| Midwest   | 35.722550 | 8.918304  | 0.249655 |
| Northeast | 38.527446 | 12.432945 | 0.322704 |
| South     | 24.863418 | 7.140688  | 0.287197 |
| West      | 34.877063 | 12.928896 | 0.370699 |

## Coefficient of Variation Explanation

The coefficient of variation relates to the dispersion and variability of data, so a lower 'cv' value means more consistent data. 

## Contrasts and Comparisons of Percent Differences

In relation to the mortality data, each of the regions have relatively similar moderate to low 'cv' values which suggests low variability amongst the data. With the Midwest having a 'cv' lowest 'cv' value of 0.249655, this means that there is 24.9655% percent of variability in the Midwest data of the difference in mortality rates between 2018 and 2021, and that the data points are closer to and around the mean.

## Mapping Table

| Functionality      | R                                 | Python                               |
|--------------------|-----------------------------------|--------------------------------------|
| Defines a function | name <- function()                | name_of_function =                   |
| Input the csv file | read.csv("csv_file")              | pd.read_csv("csv_file")              |
| Load in packages   | library(package)                  | import package as easy_abreviation   |
| To merge data      | merge(df1, df2, by="column_name") | df_name.merge(df2, on='column_name') |
| Filter data        | filter()                          | [df_name.column != "cell_name"]      |
| Mutate data        | mutate()                          | df_name.assign()                     |
| Group data         | group_by()                        | df_name.groupby()                    |
| Print data         | print()                           | print()                              |
| Summarize data     | summarise()                       | df_name.agg()                        |

## Review

I really enjoyed learning about the different functions like filter(), select(), mutate(), group_by(), and summarise() for finalizing data in R because I have never worked with coding before, and actually getting to know the language to an extent that I'm able to talk about ti with my dad and uncle now feels amazing. I also loved learning about the basics to the language because now I can learn and expand on top of my knowledge.

