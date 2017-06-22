function ARMA21
n = 100;
phi1 = -0.3;
phi2 = -0.2;
theta1 = -0.6;
sigma = 1.0;
for i = 1:n
x(i)=i
end
g = ((1+(theta1*theta1)+(2*theta1*phi1))*sigma)/(1-(phi1*phi1)-(phi2*phi2));
p(1) = 1;
p(2) = (phi1 + ((theta1*sigma)/g))/(1-phi2);
for j = 3:n
    p(j) = (phi1*p(j-1))+(phi2*p(j-2));
end
plot(x,p);
title('Correllogram for ARMA(2,1)');
end