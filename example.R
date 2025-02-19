# Title: Testing GitHub Tools with R Studio and an example data set. ----
# Date: 19/02/2025
# Author: Arwenn Kummer

# The data set is sourced from a third year independent project at the University of Cape Town. (stored in exampled data_IP_...etc.). It contains species counts, species names, and quadrat data of ground cover and leaf litter features. 

# Packages  ----

## Install packages
install.packages("tidyverse")
install.packages("readxl")

## Load Packages
library(tidyverse)
library(readxl)

# Load Data Set:
data <- read_excel("example data_ IP_combined_pitfallsoil_data_clean.xlsx")
View(example_data_IP_combined_pitfallsoil_data_clean)

# Data wrangling ----

# we're going to separate the quadrat data from the pitfall data, and from the totals at the bottom, to create 3 new databases
pitfall_demo <- read_excel("example data_ IP_combined_pitfallsoil_data_clean.xlsx", range = "G1:T32")
view(pitfall)

# now we have all the pitfall data, but we've lost which pitfall trap it belongs to! NOT GOOD! Let's get it back
# we do this by stitching seperate chunks from the data frame together:

pitfall_final <- bind_cols(read_excel("example data_ IP_combined_pitfallsoil_data_clean.xlsx", range = "A1:A32"), read_excel("example data_ IP_combined_pitfallsoil_data_clean.xlsx", range = "G1:T32"))
view(pitfall_final)

# now we have the pitfall data with the trap numbers back in place. Let's do the same for the soil data: