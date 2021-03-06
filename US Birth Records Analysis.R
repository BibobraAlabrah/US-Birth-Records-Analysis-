# Author:   Bibobra Alabrah

# title:    United States of America Birth Records Analysis

# Dataset:  US Present Birth Records

# Date:     6/7/2018
---

# Import dependencies(libraries)
library(dplyr)
library(ggplot2)
library(statsr)

# Load the dataset:
data(present)

# View the number of records and features of the dataset:
dim(present)

# Rename the dataset to birth_records:

birth_records <- present
rm(present)

# View the first 10 records of the dataset
head(birth_records, 10)

# What years are included in this dataset? 
range(birth_records$year)

# We see that the birth records span from 1940 to 2013.

# What is the total number of births for each year?

birth_records <- birth_records %>%
  mutate(total = boys + girls)
head(birth_records)

# What is the proportion of boys born each year?
birth_records <- birth_records %>%
  mutate(prop_boys = boys/total)
head(birth_records$prop_boys)

# What about the proportion of girls?
birth_records <- birth_records %>%
  mutate(prop_girls = girls/total)
head(birth_records$prop_girls)

# We can see that generally more boys were born during this time.
# Let us visualize this information.

ggplot(birth_records, aes(x = prop_boys, y = prop_girls)) +
  geom_point()+
  geom_line()

# Let us Plot these values over time and based on the plot determine if the 
# following statement is true or false: The proportion of boys born in the US has 
# decreased over time. 

ggplot(birth_records, aes(x = year, y = prop_boys)) +
  geom_point()+
  geom_line()

# Based on the plot we can see that the proportion of boys born in the US has 
# decreased over time.

# Has the number of girls increased over time?
ggplot(birth_records, aes(x = year, y = prop_girls)) +
  geom_point()+
  geom_line()

# Based on the information, the number of girls has increased over time.

# What is the boy to girl ratio for each?
birth_records <- birth_records %>%
  mutate(prop_boy_girl = boys/girls)

# Plot these values over time. Describe the observed trend? 
ggplot(birth_records, aes(x = year, y = prop_boy_girl)) +
  geom_point()

# There is initially a decrease in the boy-to-girl ratio, and then an increase 
# between 1960 and 1970, followed by a decrease. 

# In what year did we see the most total number of births in the U.S.? 
birth_records %>%
 mutate(total = total) %>%
arrange(desc(total))

# We see that the US had the most total number of births in 2007.








