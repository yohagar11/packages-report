## deja vu from earlier!
#' ---
#' output: github_document
#' ---
#' 
library(tidyverse)

## create a data frame of your installed packages
## hint: installed.packages() is the function you need
pkgs <- as_tibble(installed.packages())

## filter out the base and recommended packages
## keep the variables Package and Built
## if you use dplyr, code like this will work:
apt <- pkgs %>%
  dplyr::filter(is.na(Priority)) %>%
  dplyr::select(Package, Built)

apt_freqtable <- apt %>%
  dplyr::count(Built) %>%
  dplyr::mutate(prop = n / sum(n))


ggplot2::ggplot(apt_freqtable, aes(x = Built, y = n)) +
  geom_col()
