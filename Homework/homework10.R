# Group Members: Angela DeLeo, Roman Saddi, Kinsey Vo
install.packages("janeaustenr")
library(janeaustenr)
library(wordcloud)
library(tidyverse)
library(tidytext)
# only Sense & Sensibility
book <- austen_books() %>% filter(book == "Sense & Sensibility") %>% select(text)
# convert data to tidy format and remove stop words
book_words <- book %>% unnest_tokens(input=text, output=word) %>% anti_join(stop_words)
# count word frequencies
word_counts <- book_words %>% count(word, sort = TRUE)
word_counts
# filter words appearing more than 100 times
freq_words <- word_counts %>% filter(n > 100)
freq_words
# create word cloud
wordcloud(words = freq_words$word, freq = freq_words$n)
mydata <- tibble(document=1:3,text=c("all things bright", "all things beautiful", "created all"))
mydata <- mydata %>% unnest_tokens(input=text, output="word") %>% count(document, word) %>% bind_tf_idf(term=word, document = document, n=n) %>% select(document, word, tf_idf) %>% pivot_wider(names_from = document, values_from = tf_idf, values_fill = 0)
mydata
cossim <- function(A, B) {
    num <- sum(A *B)
    den <- sqrt(sum(A^2) * sum(B^2))
    similarity <- num / den
    return(similarity)
}
similarity <- cossim(c(1, 2, 3), c(0, 2, 5))
similarity
doc1 <- mydata$'1'
doc1
doc2 <- mydata$'2'
doc2
doc3 <- mydata$'3'
doc3
cossim(doc1, doc2)
cossim(doc1, doc3)
cossim(doc2, doc3)
library(SnowballC)
books_table <- austen_books() %>%
    unnest_tokens(word, text) %>% # Tidy format
    anti_join(stop_words) %>% # Remove stop words
    mutate(word = wordStem(word)) %>% # Stem the words
    count(book, word) %>% # Get n count of a word that appears in a book
    filter(n > 5) %>% # Retain only words that appear more than 5 times in a novel
    bind_tf_idf(word, book, n) %>% # Calculate Tf-Idf weights
    spread(book, tf_idf) %>% # Convert to table of vectors format
    select(-word) %>% # Remove word column
    mutate(across(everything(), ~ ifelse(is.na(.), 0, .))) # Replace NAs with 0
books_table
dim(books_table)
novels <- books_table[, -which(colnames(books_table) %in% c("n", "tf", "idf"))]
n_novels <- length(novels)
n_novels
similarity_matrix <- matrix(0, nrow = n_novels, ncol = n_novels)
for (i in 1:(n_novels - 1)) {
    for (j in (i + 1):n_novels) {
        similarity <- cossim(books_table[[i]], books_table[[j]])

        # Store in matrix
        similarity_matrix[i, j] <- similarity
    similarity_matrix[j, i] <- similarity
    }
}
max_similarity <- max(similarity_matrix)
most_similar_pair <- which(similarity_matrix == max_similarity, arr.ind = TRUE)
most_similar_index <- most_similar_pair[1,]
most_similar_index
most_similar_novels <- novels[most_similar_index]
most_similar_novels
max_similarity
cat("The two most similar novels are:", names(most_similar_novels)[1], "and", names(most_similar_novels)[2], "\n")
cat("Their cosine similarity is:", max_similarity, "\n")
