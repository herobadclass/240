mydata = read.csv('3610048701_databaseLoadingData.csv')

year = head(mydata[1],5)
area = unique(mydata[2])
year = as.vector(year[,1])
area = as.vector(area[,1])

y = matrix(mydata[1:75,11], nrow = 5, dimnames = list(year, area))

save(y, file = "2a.RData")