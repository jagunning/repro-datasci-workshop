library(dplyr)

biscoe_data <- read.csv("https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Biscoe.csv")

head(biscoe_data) 

anyNA(biscoe_data)

biscoe_data %>% na.omit()

biscoe_data <- biscoe_data %>% na.omit()

biscoe_data_means <- biscoe_data %>% group_by(species, sex) %>% 
  summarize(mean_bill_length = mean(bill_length_mm))

biscoe_data_means <- biscoe_data %>% group_by(species, sex) %>% 
  summarize(across(ends_with("mm") |  ends_with("g"), mean))

biscoe_data_means_imperial <- biscoe_data_means %>%
  mutate(across(ends_with("mm"), ~. *0.03937008, .names = "{.col}_in"),
         across(ends_with("g"), ~. * 0.002204623, .names = "{.col}_lb"))

library(stringr)

biscoe_data_means_imperial <- biscoe_data_means %>%
  mutate(across(ends_with("mm"), ~. *0.03937008, .names = "{.col}_in"))

biscoe_data_means_imperial <- biscoe_data_means_imperial %>% 
  rename(flipper_length_in = flipper_length_mm_in)

biscoe_data_means_imperial <- biscoe_data_means_imperial %>% 
  rename_with(~stringr::str_replace(., "mm_in", "in"), .cols = ends_with("mm_in")) %>% 
  rename_with(~stringr::str_replace(., "g_lb", "lb"), .cols = ends_with("g_lb"))

biscoe_data_means_imperial <- biscoe_data_means_imperial %>% 
  select(where(is.character) |
         ends_with("in") |
         ends_with("lb"))

biscoe_data_means_imperial <- biscoe_data_means_imperial %>% 
  select(c(where(is.character))) &
  ends_with("in")

# select pulls out columns
# filter pulls out rows
  


# Functions ---------------------------------------------------------------

my_function <- function(fav_drink = "coffee") {
  
  what_to_say <- paste0("I need ", fav_drink, "!")
  
  return(what_to_say)
  
}






my_function <- function(data_url = "https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Biscoe.csv") {

  island_data <- read.csv(data_url)
  island_data <- island_data %>% na.omit()
  
  island_data_means <- island_data %>% group_by(species, sex) %>% 
    summarize(mean_bill_length = mean(bill_length_mm))
  
  island_data_means <- island_data %>% group_by(species, sex) %>% 
    summarize(across(ends_with("mm") |  ends_with("g"), mean))
  
  island_data_means_imperial <- island_data_means %>%
    mutate(across(ends_with("mm"), ~. *0.03937008, .names = "{.col}_in"),
           across(ends_with("g"), ~. * 0.002204623, .names = "{.col}_lb"))

  island_data_means_imperial <- biscoe_data_means %>%
    mutate(across(ends_with("mm"), ~. *0.03937008, .names = "{.col}_in"))
  
  island_data_means_imperial <- island_data_means_imperial %>% 
    rename(flipper_length_in = flipper_length_mm_in)
  
  island_data_means_imperial <- island_data_means_imperial %>% 
    rename_with(~stringr::str_replace(., "mm_in", "in"), .cols = ends_with("mm_in")) %>% 
    rename_with(~stringr::str_replace(., "g_lb", "lb"), .cols = ends_with("g_lb"))
  
  island_data_means_imperial <- island_data_means_imperial %>% 
    select(where(is.character) |
             ends_with("in") |
             ends_with("lb"))

  

  return(island_data_means_imperial)
  
}

my_function("https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Biscoe.csv")

my_function()

function_output <-  my_function()








