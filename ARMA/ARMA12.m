function ARMA12
n = 100;
phi1 = 0.876;
theta1 = 0.98;
theta2 = -0.675;
sigma = 1.0;
for i = 1:n
x(i)=i
end
g = ((1+(theta1*theta1)+(theta2*theta2)+(2*phi1*theta1)+(2*theta1*theta2*phi1)+(2*phi1*phi1*theta2))*sigma)/(1-((phi1*phi1)));
p(1) = 1;
p(2) = phi1 + (((theta1+(theta1*theta2)+(theta2*phi1))*sigma)/g);
p(3) = (phi1*p(1))+((theta2*sigma)/g);
for j = 4:n
    p(j) = phi1*p(j-1);
end
plot(x,p);
title('Correllogram for ARMA(1,2)');
end