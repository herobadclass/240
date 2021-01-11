library(sp)
library(rworldmap)

## ### Welcome to rworldmap ###
## For a short introduction type : vignette('rworldmap')

library(rworldxtra)

worldmap = getMap(resolution = "high")
NrthAm = worldmap[which(worldmap$REGION=="North America"),]
plot(NrthAm, col="white", bg="lightblue",
     xlim=c(-140,-55), ylim=c(55,60))

x = dbGetQuery(dbcon, POP2006_student_number_long)
y = dbGetQuery(dbcon, POP2006_student_number_lati)
x = as.numeric(unlist(x))
y = as.numeric(unlist(y))
points(x, y, col='red', pch=16)