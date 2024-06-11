library(babynames)
library(tidyverse)
library(ggplot2)


bb_names<- babynames
marie <- bb_names %>% 
  filter(name == "Marie", year >= 1982)

ggplot(data = marie, aes(x = year))+
  geom_histogram()

joe <- bb_names %>% 
  filter(name == "Joe")
ggplot(data = joe, aes(x = year, y = prop, color = sex, linewidth = 2, alpha = 0.5))+
  geom_point()+
  geom_line()+
  labs(x = "Year",y= "Proportions", title = "Joe prop by sex")


fiv_names<- babynames %>% 
  filter(name == c("Alice","Mary","Ida","Ana","May"))


ggplot(data = fiv_names, aes(x = name, color = name, fill = name, alpha = 1))+
  geom_bar()

the_nineties <- babynames %>%  
  filter(year <2000 & year >=1990)
write_csv(the_nineties, "90s")

team_names<- babynames %>% 
  filter(year == 2005)
filter(name == c("Srijan","Joesph","Kyle","Gavin"))
ggplot(data = team_names, aes(x = name, color = name, fill = name, alpha = 1))+
  geom_bar()

srijan <- babynames %>%  
  filter(name == "Srijan")
ggplot(data = srijan, aes(x = year, y = prop, color = sex, alpha = 1))+
  geom_line()




