function takehome
n = 5000;
vari = 1;
meansum = 0;
varsum = 0;
ygau = normrnd(0,vari,n,1);

figure(1);
plot(ygau);
title('Gaussian white noise time series');
figure(2);
histogram(ygau);
title('Histogram of Gaussian white noise time series');

for i=1:n
    meansum=meansum+ygau(i);
end
gaumean = meansum/n;
display(gaumean,'Gaussian Noise Mean');
for i=1:n
    varsum = varsum + (ygau(i)-gaumean)*(ygau(i)-gaumean);
end
r0 = varsum/(n-1);
display(r0,'Variance of Gaussian white Noise');
for j=1:n-1
    for t=j+1:n
        sum=0;
        sum = sum + (ygau(t)*ygau(t-j));
    end
    r(j) = sum/(n-j);
end
r(n)=0.0;
p(1)=1;
for j=1:n-1
    p(j+1) = r(j)/r0;
end

figure(3);
plot(p);
title('Correllogram of Gaussian white noise');

%%
% AR2 Model Sequence Generation

c = 0;
phi1 = 0.6;
phi2 = -0.08;
y(1) = normrnd(0,vari);
y(2) = normrnd(0,vari);
y(3) = normrnd(0,vari);

display(y(1),'Initial Condition y(1)');
display(y(2),'Initial Condition y(2)');
display(y(3),'Initial Condition y(3)');

for i =3:n
    y(i) = c + (phi1*y(i-1)) + (phi2*y(i-2)) + ygau(i);
end

figure(4);
plot(y);
title('AR2 Time Series');
figure(5);
histogram(y);
title('Histogram of AR2 time series');

AR2mean = mean(y);
AR2variance = var(y);
display(AR2mean,'Mean of AR2');
display(AR2variance,'Variance of AR2');

p(1) = 1;
p(2) = (phi1/(1-phi2));
for j=3:n
    p(j) = (phi1*p(j-1))+(phi2*p(j-2));
end

figure(6);
plot(p);
title('Correllogram of AR2');

%%
% Curve Fitting for AR(1)
m = ar(y,1);
car1 = m.a(1);
arphi1 = m.a(2);
display(m.a);
yar1(1) = y(1);

for i = 2:n
    yar1(i) = car1 + (arphi1*yar1(i-1));
end
nar1 = yar1 - y;

figure(7);
plot(nar1);
title('Residual Time series of AR1');
figure(8);
histogram(nar1);
title('Histogram of Residual Time series of AR1');

nar1_mean = mean(nar1);
nar1_std = std(nar1);
nar1_anamoly = nar1 - nar1_mean;
nar1_anamoly_normalized = nar1_anamoly/nar1_std;

display(nar1_mean,'Mean of residual sequence for AR1');
display(nar1_std,'Variance of residual sequence for AR1');

% Correllogram
C_nar1(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+(nar1_anamoly(j)*nar1_anamoly(j-i));
    end
    C_nar1(i)=temp/(n+i);
end
rho_nar1(1)=1;
for i=2:n
    temp=0;
    for j=i+1:n
        temp=temp+ (nar1_anamoly_normalized(j)*nar1_anamoly_normalized(j-i));
    end
    rho_nar1(i)=temp/(n+i);
end

figure(9);
plot(rho_nar1);
title('Correllogram for residual of AR1');

%%
% Curve Fitting for AR(2)
m = ar(y,2);
car2 = m.a(1);
ar2phi1 = m.a(2);
ar2phi2 = m.a(3);
yar2(1) = y(1);
yar2(2) = y(2);
display(m.a);
for i = 3:n
    yar2(i) = car2 + (ar2phi1*yar2(i-1)) + (ar2phi2*yar2(i-2));
end
nar2 = yar2 - y;

figure(10);
plot(nar2);
title('Residual Time series of AR2');
figure(11);
histogram(nar2);
title('Histogram of Residual Time series of AR2');

nar2_mean = mean(nar2);
nar2_std = std(nar2);
nar2_anamoly = nar2 - nar2_mean;
nar2_anamoly_normalized = nar2_anamoly/nar2_std;

display(nar2_mean,'Mean of residual sequence for AR2');
display(nar2_std,'Variance of residual sequence for AR2');

% Correllogram
C_nar2(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+(nar2_anamoly(j)*nar2_anamoly(j-i));
    end
    C_nar2(i)=temp/(n+i);
end
rho_nar2(1)=1;
for i=2:n
    temp=0;
    for j=i+1:n
        temp=temp+ (nar2_anamoly_normalized(j)*nar2_anamoly_normalized(j-i));
    end
    rho_nar2(i)=temp/(n+i);
end

figure(12);
plot(rho_nar2);
title('Correllogram for residual of AR2');

%%
% Curve Fitting for AR(3)
m = ar(y,3);
car3 = m.a(1);
ar3phi1 = m.a(2);
ar3phi2 = m.a(3);
ar3phi3 = m.a(4);
yar3(1) = y(1);
yar3(2) = y(2);
yar3(3) = y(3);

for i = 4:n
    yar3(i) = car3 + (ar3phi1*yar3(i-1)) + (ar3phi2*yar3(i-2)) + (ar3phi3*yar3(i-3));
end
nar3 = yar3 - y;

figure(13);
plot(nar3);
title('Residual Time series of AR3');
figure(14);
histogram(nar3);
title('Histogram of Residual Time series of AR3');

nar3_mean = mean(nar3);
nar3_std = std(nar3);
nar3_anamoly = nar3 - nar3_mean;
nar3_anamoly_normalized = nar3_anamoly/nar3_std;

display(nar3_mean,'Mean of residual sequence for AR3');
display(nar3_std,'Variance of residual sequence for AR3');

% Correllogram
C_nar3(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+(nar3_anamoly(j)*nar3_anamoly(j-i));
    end
    C_nar3(i)=temp/(n+i);
end
rho_nar3(1)=1;
for i=2:n
    temp=0;
    for j=i+1:n
        temp=temp+ (nar3_anamoly_normalized(j)*nar3_anamoly_normalized(j-i));
    end
    rho_nar3(i)=temp/(n+i);
end
display(m.a);
figure(15);
plot(rho_nar3);
title('Correllogram for residual of AR3');

end