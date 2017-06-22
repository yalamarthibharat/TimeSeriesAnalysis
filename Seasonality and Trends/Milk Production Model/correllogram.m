function [rho_x] = correllogram( x )
n = length(x);
x_mean = mean(x);
x_std = std(x);
x_anamoly = x - x_mean;
x_anamoly_normalized = x_anamoly/x_std;
C_x(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+(x_anamoly(j)*x_anamoly(j-i));
    end
    C_x(i)=temp/(n+i);
end
rho_x(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+ (x_anamoly_normalized(j)*x_anamoly_normalized(j-i));
    end
    rho_x(i)=temp/(n+i);
end
end