library(ggplot2)

radius = seq(1,10000)
volume = 4/3*pi*radius^3

df <- data.frame(radius,volume)

p <- ggplot(data=df,mapping=aes(x=radius, y=volume))+
  geom_line()

print(p)