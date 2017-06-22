n = length(employment);
for i = 1:n
    x(i) = employment(i);
end
x_mean = mean(x);
x_variance = var(x);
x_std = std(x);
rho_x = correllogram(x);
display(x);
figure(1);
plot(time,x);
title('Plot of data');
figure(2);
histogram(x);
title('Histogram plot of data');
figure(3);
autocorr(x,175);
figure(4);
parcorr(x,175);
%% Removing Trend
y(1) = x(1);
for i = 2:n
    y(i) = x(i) - x(i-1);
end
y_mean = mean(y);
y_variance = var(y);
y_std = std(y);
rho_y = correllogram(y);
figure(5);
plot(time,y);
title('Plot of data after removing trend');
figure(6);
histogram(y);
title('Histogram plot of data after rremoving trend');
figure(7);
autocorr(y,175);
figure(8);
parcorr(y,175);
%% Removing Seasonality
s=12;
for i = 1:s
    z(i) = y(i);
end

for i = s+1:n
    z(i) = y(i)- y(i-s);
end
z_mean = mean(z);
z_variance = var(z);
z_std = std(z);
rho_z = correllogram(z);
figure(9);
plot(z);
title('Plot of data after removing seasonality');
figure(10);
histogram(z);
title('Histogram plot of data after removing seasonality');
figure(11);
autocorr(z,175);
figure(12);
parcorr(z,175);
%% Fitting Model
model = arima(1,0,1);
EstMdl = estimate(model,z');
display(EstMdl);
%% Generating the series
c = EstMdl.Constant;
phi1= cell2mat(EstMdl.AR);
theta1 = cell2mat(EstMdl.MA);
vari = EstMdl.Variance;
zhat(1) = z(1);
epsilon = normrnd(0,vari,n,1);
for i = 2:n
    zhat(i) = c + (phi1 * zhat(i-1)) + (theta1 * epsilon(i-1))+ epsilon(i);
end
display(zhat);
residual = z - zhat;
residual_mean = mean(residual);
residual_variance = var(residual);
figure(13);
plot(time,residual);
title('Plot of residual');
figure(14);
histogram(residual);
title('Histogram plot of residual');
figure(15);
autocorr(residual,175);
figure(16);
parcorr(residual,175);
display(residual_mean);
display(residual_variance);