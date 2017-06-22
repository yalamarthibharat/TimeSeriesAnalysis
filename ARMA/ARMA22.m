function ARMA22
n = 100;
phi1 = -0.369;
phi2 = -0.275;
theta1 = -0.388;
theta2 = 0.789;
sigma = 1.0;
for i = 1:n
x(i)=i
end
gnum =  1+(theta1*theta1)+(theta2*theta2)+(2*phi1*theta1)+(2*phi1*phi1*theta1)+(2*phi2*theta2)+(2*phi1*theta1*theta2);
gdenom = (1-(phi1*phi1)-(phi2*phi2));
g = gnum/gdenom;
p(1) = 1;
p(2) = (phi1 + (((theta1*sigma)+(theta1*theta2*sigma)+(phi1*theta2*sigma))/g))/(1-phi2);
p(3) = phi2+(phi1*p(1))+((theta2*sigma)/g);
for j = 4:n
    p(j) = (phi1*p(j-1))+(phi2*p(j-2));
end
display(p);
plot(x,p);
title('Correllogram for ARMA(2,2)');
end