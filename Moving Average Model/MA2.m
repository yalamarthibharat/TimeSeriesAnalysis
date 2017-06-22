function MA2
n=80;
theta1 = 0.985;
theta2 = 3;
for i = 1:n
x(i)=i
end
p(1) = 1;
p(2) = (theta1+(theta1*theta2))/(1+(theta1*theta1)+(theta2*theta2));
p(3) = theta2/(1+(theta1*theta1)+(theta2*theta2));
for j = 4:n
    p(j) = 0;
end
plot(x,p);
title('Correllogram of MA(2)');
end