function MAq
n=1000;
theta=0.5;
var=0.1;
for i = 1:n
x(i)=i;
end
e = wgn(n+1,1,0.1);
for j=2:n+1
    y(j-1) = e(j) + (theta*e(j-1));
   
end
display(y);
plot (x,y);
meansum=0;
for i=1:n
    meansum=meansum+y(i);
end
mean = meansum/n;
display(mean);
varsum = 0;
for i=1:n
    varsum = varsum + (y(i)-mean)*(y(i)-mean);
end
r0 = varsum/(n-1);
display(r0);
r(1)= theta*var;
for j=1:n-1
    for t=j+1:n
        sum=0;
        sum = sum + (y(t)*y(t-j));
    end
    r(j) = sum/(n-j);
end
r(1000)=0.0;
display(r);
p(1)=1;
for j=1:n-1
    p(j+1) = r(j)/r0;
end
display(p)
plot(x,p);
end