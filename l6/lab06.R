

course_url = "https://www.sfu.ca/outlines.html?2020/spring/stat/240/d100"
course_page = readLines(course_url)

#question 1a
heading_index = grep('<h3', course_page)
heading = course_page[heading_index]
heading = trimws(heading)
heading_content = gsub('<.*?>', "", heading)

#question 1b
heading_index = grep('<h1', course_page)
heading = course_page[heading_index[2]]
heading = trimws(heading)
heading_content = gsub('<.*?>', "", heading)
heading_content = gsub('.*?- ', "", heading_content)

#question 1c
course = function(url){
  course_page = readLines(url)
  heading_index = grep('<h2', course_page)
  heading = course_page[heading_index[2]+1]
  course_name = trimws(heading)
  
  heading_index = grep('<h1', course_page)
  heading = course_page[heading_index[2]]
  heading = trimws(heading)
  heading_content = gsub('<.*?>', "", heading)
  course_id = gsub('.*?- ', "", heading_content)
  
  heading_index = grep('<h4>Instructor:</h4>', course_page)
  heading = course_page[heading_index+1]
  heading = trimws(heading)
  course_instructor = gsub('<.*?>', "", heading)

  return(list(name_id = paste(course_name, course_id, sep = " "), instructor = course_instructor))
}

#question 2a
boxoffice = function(){
  movie_table = read_html("https://www.imdb.com/chart/boxoffice")
  zz = html_table(html_nodes(movie_table, "table")[[1]])
  name = zz[1:10,2]
  weekend = zz[1:10,3]
  gross = zz[1:10,4]
  weeks = zz[1:10,5]
  
  x = gregexpr('\\d+\\.\\d*',gross)
  y = regmatches(gross, x)
  y = as.numeric(y)
  perweek = y[1:10]/weeks[1:10]
  perweek = round(perweek, digits = 1)
  perweek = as.character(perweek)
  perweek = paste('$',perweek,'M',sep = '')
  
  b = data.frame('Title' = name, 'Weekend' = weekend, 'PerWeek' = perweek)
  print(b)
}

#question 2b
library(RCurl)
library(rvest)

boxoffice = function(){
  movie_table = read_html("https://www.imdb.com/chart/boxoffice")
  zz = html_table(html_nodes(movie_table, "table")[[1]])
  name = zz[1:10,2]
  weekend = zz[1:10,3]
  gross = zz[1:10,4]
  weeks = zz[1:10,5]
  
  x = gregexpr('\\d+\\.\\d*',gross)
  y = regmatches(gross, x)
  y = as.numeric(y)
  perweek = y[1:10]/weeks[1:10]
  perweek = round(perweek, digits = 1)
  perweek = as.character(perweek)
  perweek = paste('$',perweek,'M',sep = '')
  
  rating = NULL
  movie = gsub(" ", "_", name)
  for(i in 1:10){
    if(movie[i] == "Bloodshot"){
      movie[i] = paste(movie[i], "_2020", sep = "")
    }
    if(movie[i] == "The_Invisible_Man"){
      movie[i] = paste(movie[i], "_2020", sep = "")
    }
    if(movie[i] == "The_Hunt"){
      movie[i] = paste(movie[i], "_2020", sep = "")
    }
    if(movie[i] == "Sonic_the_Hedgehog"){
      movie[i] = paste(movie[i], "_2020", sep = "")
    }
    if(movie[i] == "The_Call_of_the_Wild"){
      movie[i] = paste(movie[i], "_2020", sep = "")
    }
    if(movie[i] == "Emma."){
      movie[i] = paste("Emma", "_2020", sep = "")
    }
  }
  for(i in 1:10){
    tomato_url = "https://www.rottentomatoes.com/m/"
    tomato_url = paste(tomato_url, movie[i], sep = "")
    tomato_page = readLines(tomato_url)
    rating_index = grep("ratingValue", tomato_page)
    heading = tomato_page[rating_index]
    heading = trimws(heading)
    x = gregexpr('ratingValue....',heading)
    y = regmatches(heading, x)
    y = unlist(y)
    i = gregexpr("\\d+", y)
    o = regmatches(y, i)
    o = as.character(o[1])
    if(o == "character(0)"){
      o = "NA"
    }
    rating = c(rating, o[1])
  }
  b = data.frame('Title' = name, 'Boxoffice' = gross, 'PerWeek' = perweek, 'Rating' = rating)
  print(b)
}
