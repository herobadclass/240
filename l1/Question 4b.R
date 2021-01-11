poke=read.csv(file="pokemon.csv",header=TRUE,sep=",")

att_ha=poke[poke[,"Body_Style"]=="head_arms" , "Attack"]
def_ha=poke[poke[,"Body_Style"]=="head_arms" , "Defense"]

att_sb=poke[poke[,"Body_Style"]=="serpentine_body" , "Attack"]
def_sb=poke[poke[,"Body_Style"]=="serpentine_body" , "Defense"]

plot(att_ha,def_ha,
     main="Attack vs Defense",
     xlab="Attack",
     ylab="Defense",
     lwd=1,
     type='p',
     col=1)

lines(att_sb,def_sb,
     lwd=1,
     type='p',
     col=2)

legend(x="topleft",col=1:2,lty = c(1,1),
       c("head arms","serpentine body"))