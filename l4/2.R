library(RSQLite)
library(DBI)
library(rworldmap)
library(rworldxtra)
library(MASS)
library(sp)
library(maps)
library(mapdata)

library(RColorBrewer)
k <- 11
my.cols <- rev(brewer.pal(k, "RdYlBu"))

#worldmap = getMap(resolution = "high")
#NrthAm = worldmap[which(worldmap$REGION =="North America"),]
#plot(NrthAm, xlim=c(-123.35,-122.65),
#     ylim=c(49,49.35), main = "Pokemon in Vancouver")
map("worldHires","Canada", xlim=c(-123.35,-122.65),
    ylim=c(49,49.35), main = "Pokemon in Vancouver")
dbcon = dbConnect(SQLite(), dbname="lab03.sqlite")

vanpoke_latitude = "SELECT latitude FROM Vanpoke"
vanpoke_longitude = "SELECT longitude FROM Vanpoke"

vanpoke_latitude = dbGetQuery(dbcon, vanpoke_latitude)
vanpoke_longitude = dbGetQuery(dbcon, vanpoke_longitude)

vanpoke_latitude = as.numeric(unlist(vanpoke_latitude))
vanpoke_longitude = as.numeric(unlist(vanpoke_longitude))

points(vanpoke_longitude, vanpoke_latitude, pch = 20, cex = .01)

a = kde2d(vanpoke_longitude, vanpoke_latitude)

contour(a,a,nlevels=k, col=my.cols, add=TRUE)