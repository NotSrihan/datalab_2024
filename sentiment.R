library(ggplot2)
library(dplyr)
library(tidytext)
library(gsheet)
library(wordcloud2)
library(sentimentr)
library(lubridate)
library(tidyverse)
library(readr)

survey <- gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1W9eGIihIHppys3LZe5FNbUuaIi_tfdscIq521lidRBU/edit?usp=sharing')

head(survey)

survey <- survey %>% 
mutate(date_time = mdy_hms(Timestamp))

ggplot(data=survey, aes(x=first_name, y = date_time))+
  geom_point()
sentiments <- get_sentiments('bing')
ncol(sentiments)
nrow(sentiments)  
words <- survey %>%
  dplyr::select(first_name,
                feeling_num,
                feeling) %>%
  unnest_tokens(word, feeling)

word_freq <- words %>% group_by(word) %>% tally()
wordcloud2(word_freq, size =2, shape = "brain")
sw<- read_csv('https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/stopwords.csv')
nodup<-word_freq %>% 
filter(!word%in%sw$word) 
wordcloud2(nodup, size =0.5, shape = "triangle")
nodup<-nodup %>% 
arrange(desc(n))

top10<- head(nodup,10)
ggplot(data = top10, aes(x = word, y = n, fill = word))+
  geom_col()
