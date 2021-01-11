library(RSQLite)

dbcon = dbConnect(SQLite(), dbname='lab03.sqlite')

#dist_year = "SELECT DISTINCT year FROM WinterO"

#print(dbGetQuery(dbcon, dist_year))

#pokem_hight_desc = "SELECT DISTINCT Height_m FROM Pokem ORDER BY Height_m DESC"

#print(dbGetQuery(dbcon, pokem_hight_desc))

vanpoke_cp = "SELECT cp FROM Vanpoke"

vanpoke_cp = dbGetQuery(dbcon, vanpoke_cp)

vanpoke_cp = as.integer(unlist(vanpoke_cp))

hist(vanpoke_cp)

d = density(vanpoke_cp)

plot(d)