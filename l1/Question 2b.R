radius = seq(1,10000)
volume = 4/3*pi*radius^3

par(mfrow=c(1,1))
plot(radius,volume,
     main="type l = lines",
     xlab="radius",
     ylab="volume",
     ylim=c(0,1500),
     xlim=c(-1,9),
     col="red",
     lwd=1,
     type="l",
     lty=1)
