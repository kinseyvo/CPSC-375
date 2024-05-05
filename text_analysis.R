library(tidyverse)
library(tidytext)
text <- c("Because I could not stop for Death -",
"He kindly stopped for me -",
"The Carriage held but just Ourselves -",
"and Immortality")
text
text_df <- tibble(line = 1:4, text = text)
text_df
text_df %>% unnest_tokens(input=text, output="word")
text_df <- tibble(line = 1:4, text = text)
iris
as_tibble(iris)
text_df <- tibble(line = 1:4, text = text)
text_df %>% 
  unnest_tokens(input=text, output="word") %>%
  group_by(word) %>% summarise(n())
text_df %>% unnest_tokens(input=text, output="word") %>% 
  count(word)

library(wordcloud)
wordcloud(c("Hello", "how", "are", "you"), c(50,40,20,40))
stop_words
stop_words %>% group_by(lexicon) %>% count()

library(SnowballC)
wordStem("learns")
wordStem("learning")
wordStem("learned")
wordStem("family")
wordStem("families")
?wordStem
getStemLanguages()
csuf <- read_csv("hashcsufnew.csv")
tweet <- csuf %>% select(text)
tweet %>% unnest_tokens(input=text, output="word")
tweet %>% unnest_tokens(input=text, output="word") %>% anti_join(stop_words)
tweet %>% unnest_tokens(input=text, output="word") %>% anti_join(stop_words) %>% mutate(word = wordStem(word))
tweet %>% unnest_tokens(input=text, output="word") %>% anti_join(stop_words) %>% mutate(word = wordStem(word)) %>% count(word)
tweet %>% unnest_tokens(input=text, output="word") %>% anti_join(stop_words) %>% mutate(word = wordStem(word)) %>% count(word) %>% filter(n > 200)
newObj3 <- tweet %>% unnest_tokens(input=text, output="word") %>% anti_join(stop_words) %>% mutate(word = wordStem(word)) %>% count(word) %>% filter(n > 200)
wordcloud(newObj3$word, newObj3$n)
log(1e6/1)
1e6
log(1e6/100)
log(1e6/1000)
log(1e6/10000)
log(1e6/100000)
log(1e6/1e6)
log(3/2)
1/3
0.333333*0.4
log(3/3)
c("see spot", "see spot run", "run spot run")
library(tidyverse)
tibble(c("see spot", "see spot run", "run spot run"))
tibble(text=c("see spot", "see spot run", "run spot run"))
library(tidytext)
tibble(text=c("see spot", "see spot run", "run spot run")) %>% unnest_tokens(input=text, output="word")
tibble(document=1:3, text=c("see spot", "see spot run", "run spot run")) %>% unnest_tokens(input=text, output="word")
tibble(document=1:3, text=c("see spot", "see spot run", "run spot run")) %>% unnest_tokens(input=text, output="word") %>% count(word)
tibble(document=1:3, text=c("see spot", "see spot run", "run spot run")) %>% unnest_tokens(input=text, output="word") %>% count(document, word)
tibble(document=1:3, text=c("see spot", "see spot run", "run spot run")) %>% unnest_tokens(input=text, output="word") %>% count(document, word) %>% bind_tf_idf(term = word, document = document, n = n)
tibble(document=1:3, text=c("see spot", "see spot run", "run spot run")) %>% unnest_tokens(input=text, output="word") %>% count(document, word) %>% bind_tf_idf(term = word, document = document, n = n) %>% pivot_wider(names_from = document, values_from = tf_idf)
tibble(document=1:3, text=c("see spot", "see spot run", "run spot run")) %>% unnest_tokens(input=text, output="word") %>% count(document, word) %>% bind_tf_idf(term = word, document = document, n = n) %>% select(document, word, tf_idf) %>% pivot_wider(names_from = document, values_from = tf_idf)
tibble(document=1:3, text=c("see spot", "see spot run", "run spot run")) %>% unnest_tokens(input=text, output="word") %>% count(document, word) %>% bind_tf_idf(term = word, document = document, n = n) %>% select(document, word, tf_idf) %>% pivot_wider(names_from = document, values_from = tf_idf, values_fill = 0)
myvectors <- tibble(document=1:3, text=c("see spot", "see spot run", "run spot run")) %>% unnest_tokens(input=text, output="word") %>% count(document, word) %>% bind_tf_idf(term = word, document = document, n = n) %>% select(document, word, tf_idf) %>% pivot_wider(names_from = document, values_from = tf_idf, values_fill = 0)

myvectors
myvectors %>% select('1') # not a vector
myvectors$'1'
myvectors %>% select('1') %>% as.vector()
myvectors[[2]]
myvectors[[1]]
myvectors[2] # not a vector
D1 <- myvectors[[2]]
sqrt(sum(D1^2))
D1 / sqrt(sum(D1^2))
D1.norm <- D1 / sqrt(sum(D1^2))
D1.norm
D2 <- myvectors[[3]]
D2.norm <- D2 / sqrt(sum(D2^2))
D2.norm
sum(D1.norm * D2.norm)
