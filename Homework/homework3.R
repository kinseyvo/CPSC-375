# Homework 3
library(nycflights13)
flights
library(tidyverse)
flights %>% filter(month == 3, day == 12, year == 2013)
flights %>% filter(arr_delay > 2, dep_delay > 2)
flights %>% filter(arr_delay > 2 | dep_delay)
flights %>% filter(arr_delay > 2 | dep_delay > 2)
flights %>% filter(carrier == "UA" | carrier == "AA" | carrier == "DL")
flights %>% arrange(air_time)
flights %>% arrange(-air_time)
flights %>% select(origin, dest, air_time) %>% arrange(air_time)
flights %>% mutate(total_delay = (arr_delay + dep_delay))
flights %>% mutate(total_delay = (arr_delay + dep_delay)) %>% select(origin, dest, dep_delay, arr_delay, total_delay) %>% arrange(-total_delay) %>% select(origin, dest)
flights %>% mutate(total_delay = (arr_delay + dep_delay)) %>% select(origin, dest, dep_delay, arr_delay, total_delay) %>% arrange(-total_delay) %>% select(origin, dest) %>% slice(1:10)
flights %>% mutate(total_delay = (arr_delay + dep_delay)) %>% select(origin, dest, dep_delay, arr_delay, total_delay) %>% arrange(-total_delay) %>% select(origin, dest, total_delay) %>% slice(1:10)
flights %>% select(arr_delay, dep_delay, origin, dest) %>% mutate(total_delay = (arr_delay + dep_delay)) %>% arrange(-total_delay) %>% select(origin, dest)
flights %>% mutate(total_delay = (arr_delay + dep_delay)) %>% summarise(mean(total_delay, na.rm = TRUE))
flights %>% select(arr_delay, dep_delay, dest, carrier) %>% mutate(total_delay = (arr_delay + dep_delay)) %>% group_by(dest, carrier) %>% summarise(mean(total_delay, na.rm = TRUE))
flights %>% select(arr_delay, dep_delay, dest, origin, carrier) %>% mutate(total_delay = (arr_delay + dep_delay)) %>% group_by(dest, origin, carrier) %>% summarise(mean(total_delay, na.rm = TRUE))
survey <- read_csv("surveydataSpring2024.csv")
survey
View(survey)
survey %>% filter(Statistics == 10)
survey %>% filter(Statistics == 10, Math == 10)
survey %>% filter(Statistics == 10, Math == 10) %>% select(Semester, Communication, Visualization)
survey %>% select(Semester, Communication, Visualization, Statistics, Math) %>% arrange(-Statistics, -Math) %>% select(Semester, Communication, Visualization)
survey %>% filter(is.na(Statistics))
max_math_stat()
survey %>% select(Year, Semester, Math, Statistics) %>% mutate(max_math_stat = (pmax(Math, Statistics, na.rm = TRUE)))
survey %>% summarise(median(ComputerScience, na.rm = TRUE))
survey %>% filter(Semester == "Spring", Year == 2024) %>% summarise(median(ComputerScience, na.rm = TRUE))
survey %>% group_by(Year) %>% summarise(median(ComputerScience, na.rm=TRUE), median(Math, na.rm=TRUE), median(Statistics, na.rm=TRUE))
survey %>% group_by(-Year) %>% summarise(median(ComputerScience, na.rm=TRUE), median(Math, na.rm=TRUE), median(Statistics, na.rm=TRUE))
survey %>% group_by(Year) %>% filter(TakenCPSC483 == "Yes") %>% summarise(median(ComputerScience, na.rm=TRUE), median(Math, na.rm=TRUE), median(Statistics, na.rm=TRUE))
survey %>% group_by(TakenCPSC483) %>% summarise(median(ComputerScience, na.rm=TRUE), median(Math, na.rm=TRUE), median(Statistics, na.rm=TRUE))
survey %>% group_by(Semester, Year) %>% tally()
