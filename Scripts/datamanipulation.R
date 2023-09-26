library(tidyr) #"reshaping" data
library(dplyr) #dataframe manipulation
library(palmerpenguins)

data(package = "palmerpenguins")

penguins_data <- penguins

class(penguins_data)

head(penguins_data)

str(penguins_data)

unique(penguins_data$species)

levels(penguins$island)

is.ordered(penguins_data$species)

mean(penguins_data$body_mass_g)

mean(penguins_data$body_mass_g, na.rm = TRUE)

str(penguins_data)

islandyear <- select(penguins_data, island, year)

str(islandyear)

torgpenguins <- filter(penguins_data, island == "Torgersen")

str(torgpenguins)

torgpenguins <- filter(penguins_data, island == "Torgersen")

torgpenguinssexspecies <- select(torgpenguins, sex, species)

str(torgpenguinssexspecies)

torgpenguinsone <- filter(penguins_data, island == "Torgersen") %>%
  select(sex, species)
  
# %>% shortcut: command shift m

torgpenguins <- torgpenguins %>% 
  mutate(roundbilllength = round(bill_length_mm)) %>% 
  select(species, sex, roundbilllength)

torgpenguinssummary <- torgpenguins %>% 
  group_by(species, sex) %>% 
  summarize(meanbilllength = mean (roundbilllength, na.rm = TRUE))

penguincounts <- penguins_data %>% 
  group_by(species, sex, island) %>% 
  summarize(n = dplyr::n())

penguinswide <- penguincounts %>% 
  pivot_wider(names_from = island, values_from = n, values_fill = 0)
#values fill changes the NAs to 0's

penguinslongagain <- penguinswide %>% 
  pivot_longer(-c(species, sex), values_to = "count")










