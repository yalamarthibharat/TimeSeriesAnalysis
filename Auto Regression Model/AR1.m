function AR1
n=1000;
phi=0.5;
var=0.1;
for i = 1:n
x(i)=i;
end
e = wgn(n+1,1,0.1);
yt(1)=0;
for j=2:n+1
    yt(j)=(phi*yt(j-1))+e(j);
end
%display(yt);
for j=1:n
    y(j) = yt(j+1);
end
display(y);
p(1)=1;
for j=2:n
    p(j)=phi^j;
end
display(p);
plot(x,p);
end

