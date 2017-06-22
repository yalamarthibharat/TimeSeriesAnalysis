n = length(electricity);
for i = 1:n
    x(i) = electricity(i);
end
x_mean = mean(x);
x_variance = var(x);
x_std = std(x);
display(x);
figure(1);
plot(time_electricity,x);
title('Plot of data');
figure(2);
histogram(x);
title('Histogram plot of data');
figure(3);
autocorr(x,470);
figure(4);
parcorr(x,470);
%% Removing Trend
y(1) = x(1);
for i = 2:n
    y(i) = x(i) - x(i-1);
end
y_mean = mean(y);
y_variance = var(y);
y_std = std(y);
figure(5);
plot(time_electricity,y);
title('Plot of data after removing trend');
figure(6);
histogram(y);
title('Histogram plot of data after removing trend');
figure(7);
autocorr(y,470);
figure(8);
parcorr(y,470);
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
figure(9);
plot(time_electricity,z);
title('Plot of data after removing seasonality');
figure(10);
histogram(z);
title('Histogram plot of data after removing seasonality');
figure(11);
autocorr(z,470);
figure(12);
parcorr(z,470);
%% Fitting Model
model = arima(2,0,2);
EstMdl = estimate(model,z');
display(EstMdl);
%% Generating the series
c = EstMdl.Constant;
phi1= cell2mat(EstMdl.AR(1));
phi2= cell2mat(EstMdl.AR(2));
theta1 = cell2mat(EstMdl.MA(1));
theta2 = cell2mat(EstMdl.MA(2));
vari = EstMdl.Variance;
zhat(1) = z(1);
zhat(2) = z(2);
epsilon = normrnd(0,vari,n,1);
for i = 3:n
    zhat(i) = c + (phi1 * zhat(i-1)) + (phi2 * zhat(i-2))+ (theta1 * epsilon(i-1))+ (theta2 * epsilon(i-2))+ epsilon(i);
end
residual = z - zhat;
residual_mean = mean(residual);
residual_variance = var(residual);
figure(13);
plot(time_electricity,residual);
title('Plot of residual');
figure(14);
histogram(residual);
title('Histogram plot of residual');
figure(15);
autocorr(residual,470);
figure(16);
parcorr(residual,470);
display(residual_mean);
display(residual_variance);