poke=read.csv(file="pokemon.csv",header=TRUE,sep=",")

print(poke[poke[,"isLegendary"]=="TRUE" & poke[,"Height_m"]>2, "Name"])