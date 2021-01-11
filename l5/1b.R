library(wordcloud)
library(tm)
library(RColorBrewer)

fn = "alice.txt"
s = readChar(fn, file.info(fn)$size)

s = trimws(s)
x = strsplit(tolower(s), '\\s+')
x = unlist(x)
x = removePunctuation(x)

print(system.time(for(i in 1:200)
  unlist(x)[!(unlist(x) %in% stopwords('en'))]))

p = table(x)
wordcloud(names(t), t, max.words=20, colors = brewer.pal(8,"Dark2"))
