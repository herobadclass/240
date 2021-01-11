x = seq(1,6, by=1)
y = x^2

#x^2
plot(x,y,
     main="x^2 vs 2^x",
     xlab="x-axis",
     ylab="y-axis",
     lwd=3,
     type='l',
     col=1)

#2^x
lines(x,2^x,
      lwd=3,
      type='b',
      col=2)

legend(x="topleft",col=1:2,lty = c(1,6),
       c("x^2","2^x"))
