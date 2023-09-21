#practice script for the reproducibility data sci workshop
# Jordan Gunning
# 2023-09-96

# Load packages ----
library(readr)
library(lme4)
library(dplyr)

# Read in data -----
gapminder <- read.csv("Data/gapminder_data.csv")
head(gapminder)
str(gapminder)

# Wrangle data ------------------------------------------------------------
# command shift R to create new section

gap_1980s <- filter(gapminder, year >= 1980, year < 1990)

gap_big <- filter(gapminder, pop > 10000000)


# Write data --------------------------------------------------------------

write_csv(gap_1980s, "data_clean/gapminder_1980s.csv")

print("hello")
print("sup")
print("ya")


