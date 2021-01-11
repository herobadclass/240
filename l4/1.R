counts = function(a,n){
  i = rep(0, n)
  
  interval = (max(a) - min(a))/n
  
  for(x in 1:length(a)){
    for(y in 1:n-1){
      if(a[x] >= (min(a) + (y-1)*interval) & a[x] < (min(a) + y*interval)){
        i[y] = i[y] + 1
      }
      y = y + 1
    }
    if(a[x] >= (min(a) + (n-1)*interval) & a[x] <= (min(a) + n*interval)){
      i[y] = i[y] + 1
    }
    x = x + 1
  }
  
  return(i)
}

histo = function(a,n){
  plot(1,
       type="n",
       xlab="x",
       ylab="Counts",
       xlim=c(min(a)-1,max(a)),
       ylim=c(0,length(a)))
  
  i = counts(a,n)
  interval = (max(a) - min(a))/n
  
  for(z in 1:length(i)){
    m1 = min(a)+(z-1)*interval
    m2 = min(a)+z*interval
    lines(c(m1,m1),c(i[z],i[z]),type = 'h')
    lines(c(m2,m2),c(i[z],i[z]),type = 'h')
    lines(c(m1,m2),c(i[z],i[z]))
    z = z + 1
  }
}
#a = rnorm(100, mean = -1, sd = sqrt(1))
#b = rnorm(100, mean = 1, sd = sqrt(1))
#A = c(a,b)
A = c(0, 0, 0, 1, 1, 2)
n = 3
histo(A,n)

