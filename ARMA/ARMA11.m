function ARMA11
n = 300;
phi = -0.5;
theta = 0.9;
sigma = 1;
for i = 1:n
x(i)=i
end
g = ((1+(theta*theta)+(2*phi*theta)*sigma))/(1-(phi*phi));
p(1) = 1;
p(2) = ((1+(theta*phi))*(theta+phi)*sigma)/(g*(1-(phi*phi)));
for j = 3:n
    p(j) = phi*p(j-1);
end
plot(x,p);
title('Correllogram for ARMA(1,1)');
end