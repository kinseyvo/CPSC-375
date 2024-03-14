# Group Members: Angela DeLeo, Roman Saddi, Kinsey Vo
library(tidyverse)
billboard_tidy <- billboard %>% pivot_longer(cols = starts_with("wk"), names_to = "week", values_to = "rank") %>% mutate(week = as.numeric(str_replace(week, "wk", "")))
billboard_tidy
billboard_tidy %>% filter(!is.na(rank)) %>% group_by(track) %>% summarise(weeks_on_chart = n_distinct(week))
billboard_tidy %>% filter(!is.na(rank)) %>% group_by(track) %>% summarise(weeks_on_chart = n_distinct(week)) %>% arrange(desc(weeks_on_chart))
billboard_tidy %>% group_by(track) %>% summarise(top_rank = min(rank, na.rm = TRUE))
billboard_tidy %>% group_by(track) %>% summarise(top_rank = min(rank, na.rm = TRUE)) %>% arrange(top_rank)
billboard_tidy %>% group_by(artist) %>% summarise(top_rank = min(rank, na.rm = TRUE))
billboard_tidy %>% group_by(artist) %>% summarise(top_rank = min(rank, na.rm = TRUE)) %>% arrange(top_rank)
billboard_tidy %>% filter(!is.na(rank)) %>% group_by(track) %>% summarise(weeks_on_chart = n_distinct(week)) %>% filter(weeks_on_chart > 35)
billboard_tidy %>% filter(!is.na(rank)) %>% group_by(track, artist) %>% summarise(weeks_on_chart = n_distinct(week)) %>% filter(weeks_on_chart)
billboard_tidy %>% filter(!is.na(rank)) %>% group_by(track, artist) %>% summarise(weeks_on_chart = n_distinct(week)) %>% filter(weeks_on_chart > 35)
demographics <- read_csv("demographics.csv")
demographics
# '-' excludes column
demographics_tidy <- demographics %>% select(-'Series Name') %>% pivot_wider(names_from = 'Series Code', values_from = YR2015)
demographics_tidy
demographics_combined <- demographics_tidy %>% mutate(SP.POP.0014.IN = SP.POP.0014.FE.IN + SP.POP.0014.MA.IN, SP.POP.1564.IN = SP.POP.1564.FE.IN + SP.POP.1564.MA.IN, SP.POP.65UP.IN = SP.POP.65UP.FE.IN + SP.POP.65UP.MA.IN, SP.POP.80UP = SP.POP.80UP.FE + SP.POP.80UP.MA, SP.DYN.AMRT.TOTL = SP.DYN.AMRT.FE + SP.DYN.AMRT.MA, SP.POP.TOTL.IN = SP.POP.0014.IN + SP.POP.1564.IN + SP.POP.65UP.IN) %>% select(-contains("FE"), -contains("MA"))
demographics_combined
demographics_combined %>% group_by(`Country Name`) %>% summarise(lowest_14_to_pop = (SP.POP.0014.IN / SP.POP.TOTL)) %>% arrange(lowest_14_to_pop) %>% slice(1:5)
