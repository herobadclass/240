f1 = 1
f2 = 1

sum = f1+f2

N = 1:18
for(i in N){fn=f1+f2; f1=f2; f2=fn; sum=sum+fn; i=i+1}
print(sum)