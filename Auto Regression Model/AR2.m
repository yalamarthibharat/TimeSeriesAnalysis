function AR2
n = 1000;
phi1 = -0.789;
phi2 = -0.967;
F = [phi1 phi2; 1 0];
eigenval = eig(F);
%%
for i = 1:n
    x(i) = i;
end
rho(1) = 1;
rho(2) = phi1/(1-phi2);
for j = 3:n
    rho(j) = (phi1*rho(j-1)) + (phi2 *rho(j-2));
end
display(eigenval);
plot(x,rho);
title('Correllogram of AR(2)');
end