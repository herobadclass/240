library(wordcloud)
library(tm)
library(RColorBrewer)

fn = "alice.txt"
text = readLines(fn)
corp = VCorpus(VectorSource(text))

corp = tm_map(corp,removeNumbers)
corp = tm_map(corp,removePunctuation)
corp = tm_map(corp,content_transformer(tolower))
corp = tm_map(corp,removeWords, stopwords("english"))
corp = tm_map(corp,stripWhitespace)


dtm = TermDocumentMatrix(corp)
m = as.matrix(dtm)
v = sort(rowSums(m),decreasing=TRUE)
d = data.frame(word = names(v),freq=v)

layout(matrix(c(1, 2), nrow=2), heights=c(1, 4))
par(mar=rep(0, 4))
plot.new()
text(x=0.5, y=0.5, "ALICE'S ADVENTURES IN WONDERLAND WORDCLOUD")
wordcloud(words = d$word, freq = d$freq,
          
          max.words=20, random.order=FALSE,
          colors=brewer.pal(8, "Dark2"))
