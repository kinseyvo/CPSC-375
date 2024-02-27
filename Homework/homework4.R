# Group Members: Angela DeLeo, Roman Saddi, Kinsey Vo
library(tidyverse)
data= matrix(c(1:16), ncol=4, byrow=TRUE)
name <- c("Mick", "John", "Paul", "Paul")
lastname <- c("Jagger", "Lennon", "McCartney", "McCartney")
band <- c("Stones", "Beatles", "Beatles", "Wings")
year <- c("1962", "1960", "1960", "1971")
bands <- data.frame(Name = name, Lastname = lastname, Band = band, Year = year)
bands
artist <- c("John", "Paul", "Keith", "Paul")
artistname <- c("Lennon", "McCartney", "Richards", "McCartney")
plays <- c("guitar", "bass", "guitar", "bass")
model <- c("Gibson", "Hofner", "Fender", "Hofner")
instruments <- data.frame(Artist = artist, Artistname = artistname, Plays = plays, Model = model)
instruments
bands
instruments
bands %>% inner_join(instruments)
bands %>% inner_join(instruments, by=c(name="artist"))
rlang::last_trace()
library(tidyverse)
bands <- read_csv("bands.csv")
instruments <- read_csv("instruments.csv")
bands
instruments
bands %>% inner_join(instruments)
bands %>% inner_join(instruments, by=c(name="artist"))
bands %>% inner_join(instruments, by=c(name="artist", lastname="artistname"))
bands %>% left_join(instruments, by=c(name="artist", lastname="artistname"))
bands %>% inner_join(instruments, by=c(name="artist", lastname="artistname", year="plays"))
library(nycflights13)
flights %>% mutate(flights, (total_delay = dep_delay + arr_delay))
flights %>% mutate(total_delay = (arr_delay + dep_delay)) %>% select(origin, dest, total_delay) %>% arrange(desc(total_delay)) %>% slice(1:10)
enrollment <- tibble(Year = c(2024, rep(2023, each=3), rep(2022, each=2), rep(2021,each=3), rep(seq(2020,2019,by=-1), each=2), 2018), Semester = c("Spring", "Fall", "Summer", "Spring", "Summer", "Spring", "Fall", "Summer", rep(c("Spring","Fall"), times=3)), Enrolled = c(74,26,34,85,21,79,42,34,79,44,57,36,70,45))
enrollment
survey <- read_csv("surveydataSpring2024.csv")
survey
survey_responses <- survey %>% group_by(Year, Semester) %>% tally() %>% rename(Responses = n)
survey_responses
enrollment %>% inner_join(survey_responses) %>% select(Year, Semester, Responses, Enrolled)
