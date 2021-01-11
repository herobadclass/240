radius = c(1,3,5,7)
volume = 4/3*pi*radius^3

par(mfrow=c(2,2))
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
plot(radius,volume,
     main="type p = points",
     xlab="radius",
     ylab="volume",
     ylim=c(0,1500),
     xlim=c(-1,9),
     col="green",
     lwd=2,
     type="p",
     lty=1)
plot(radius,volume,
     main="type n = doesn't draw lines or points",
     xlab="radius",
     ylab="volume",
     ylim=c(0,1500),
     xlim=c(-1,9),
     col="black",
     lwd=3,
     type="n",
     lty=1)
plot(radius,volume,
     main="type b = plots connected by lines",
     xlab="radius",
     ylab="volume",
     ylim=c(0,1500),
     xlim=c(-1,9),
     col="blue",
     lwd=4,
     type="b",
     lty=1)
