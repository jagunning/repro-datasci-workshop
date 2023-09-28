library(dplyr)


# Functions ---------------------------------------------------------------

my_function <- function(island_to_use = "Biscoe") {
  
  if(island_to_use == "Biscoe") {
    data_url <- "https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Biscoe.csv"
  } else if (island_to_use == "Dream"){
    data_url <- "https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Dream.csv"
  } else if (island_to_use == "Torgersen"){
    data_url <- "https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Torgersen.csv"
  } else {
    stop("Island to use doesn't exist")

  }
  
  
  island_data <- read.csv(data_url)
  island_data <- island_data %>% na.omit()

  # island_data_means <- island_data %>% group_by(species, sex) %>%
  #   summarize(mean_bill_length = mean(bill_length_mm))

  island_data_means <- island_data %>% group_by(species, sex) %>%
    summarize(across(ends_with("mm") |  ends_with("g"), mean))

  island_data_means_imperial <- island_data_means %>%
    mutate(across(ends_with("mm"), ~. *0.03937008, .names = "{.col}_in"),
           across(ends_with("g"), ~. * 0.002204623, .names = "{.col}_lb"))

  # island_data_means_imperial <- biscoe_data_means %>%
  #   mutate(across(ends_with("mm"), ~. *0.03937008, .names = "{.col}_in"))

  # island_data_means_imperial <- island_data_means_imperial %>%
  #   rename(flipper_length_in = flipper_length_mm_in)

  island_data_means_imperial <- island_data_means_imperial %>%
    rename_with(~stringr::str_replace(., "mm_in", "in"), .cols = ends_with("mm_in")) %>%
    rename_with(~stringr::str_replace(., "g_lb", "lb"), .cols = ends_with("g_lb"))

  island_data_means_imperial <- island_data_means_imperial %>%
    select(where(is.character) |
             ends_with("in") |
             ends_with("lb"))

  return(island_data_means_imperial)

}


my_function()

biscoe_output <-  my_function(island_to_use = "Biscoe")
torgersen_output <-  my_function(island_to_use = "Torgersen")


biscoe_output <-  my_function(island_to_use = "lol")

# For loops ---------------------------------------------------------------

islands_we_want <- c("Biscoe", "Dream", "Torgersen")
cleaned_data <- list()

for(i in 1:3){
  
  # my_function(islands_we_want[1])
  cleaned_data[[i]] <-my_function(islands_we_want[i])

  }

names(cleaned_data) <- island_we_want

cleaned_data_df <- bind_rows(cleaned_data, .id = "island")






