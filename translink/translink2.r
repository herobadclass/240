translink = function(y,m,d,h){
  load(file = 'translink.rdata')
  v = NULL
  f = NULL
  for(i in 1:length(data)){
    t = data[[i]]$created #date and time tweet i was posted in UTC
    g = gregexpr('[1-9][0-9]*', t) #reg expression that isolates date and time and removes leading 0s
    b = regmatches(t, g) #parts in t that matches the reg expression g
    b = unlist(b) #vector of date and time tweet i was posted in UTC
    
    if(b[1] == y & b[2] == m & b[3] == d & b[4] == h){ #filters for input date
      #print(i)
      w = data[[i]]$text #text of tweet i
      if(length(grep('\\bdetours?\\b', w, ignore.case = TRUE)) & 
      (length(grep('\\bover\\b', w, ignore.case = TRUE)) | 
       length(grep('\\bclear(ed)?\\b', w, ignore.case = TRUE)))){ #filters for tweets that have the words 'detour(S)' and ('over' or 'clear(ed))'
        s = gregexpr('\\bR?N?\\d+\\b.+detours?', w) #reg expression that isolates bus number to the word 'detour(s)'
        x = regmatches(w, s) #parts in s that matches the reg expression s
        ss = gregexpr('\\bR?N?\\d+\\b', x) #reg expression that isolates the bus number
        xx = regmatches(x, ss) #parts in x that matches the reg expression ss
        xx = trimws(xx[[1]])
        v = union(v,xx) #vector of stops that stopped having disturbances
      }
      else if(length(grep('detours?', w, ignore.case = TRUE))){ #filters for tweets that have the word 'detour(S)' and not ('over' or 'clear(ed))'
        s = gregexpr('\\bR?N?\\d+\\b.+detours?', w) #reg expression that isolates bus number to the word 'detour(s)'
        x = regmatches(w, s) #parts in s that matches the reg expression s
        ss = gregexpr('\\bR?N?\\d+\\b', x) #reg expression that isolates the bus number
        xx = regmatches(x, ss) #parts in x that matches the reg expression ss
        xx = trimws(xx[[1]])
        f = union(f,xx) #vector of stops that started having disturbances
      }
    }
    disruptions_list = list(start = f, stop = v)
  }
  return(disruptions_list)
}

disruptions = translink(2020, 1, 28, 6)