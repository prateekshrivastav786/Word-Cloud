
# This is a R code for creating the word cloud.
# readtext is is used for importing the text file 
library(readtext)
rawdata = readtext("C:/Users/Prateek/Desktop/TA Project/speeches.txt")

# preprocessig the data
# we need to install the corpus package along with the tm
install.packages("corpus")
library(corpus)
install.packages("tm")
library(tm)

# calling the Corpus function 
corpusdata = Corpus(VectorSource(rawdata))

# cleaning the data by removing the stop words, punctuation and mking them in a lower case to get better data
controldata = list(removePunctuation = TRUE, stopwords = TRUE, tolower = TRUE)
termdm= TermDocumentMatrix(corpusdata, control= controldata)
tf = as.matrix(termdm)

#Now installing the wordcloud package.
install.packages("wordcloud")
library(wordcloud)
wordcloud(rownames(tf), tf, min.freq =5, scale=c(5, .2), random.order = FALSE, random.color = FALSE, colors=brewer.pal(6,"Dark2"))

# teh parameters are up to the requirments of your query as min.freq shows the frequency of the words.