library(wordcloud)
library(tm)
library(RColorBrewer)

fn = "alice.txt"
s = readChar(fn, file.info(fn)$size)

s = trimws(s)
x = strsplit(tolower(s), '\\s+')
x = unlist(x)
x = removePunctuation(x)
#x = unlist(x)[!(unlist(x) %in% stopwords('en'))]
t = table(x)

print(system.time(for (i in 1:100)
  for(j in 1:length(t)){
    if((names(t[j]) %in% stopwords('en'))){
    t[[j]] = 0
  }
}))
wordcloud(names(t), t, max.words=20, colors = brewer.pal(8,"Dark2"))