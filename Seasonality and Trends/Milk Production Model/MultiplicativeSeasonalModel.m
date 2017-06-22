n = length(milkdata);
for i = 1:n
    x(i) = milkdata(i);
end
x_mean = mean(x);
x_variance = var(x);
x_std = std(x);
rho_x = correllogram(x);
figure(1);
plot(x);
title('Milk data from Jan 1962 - Dec 1975');
figure(2);
histogram(x);
title('Histogram of Milk data from jan 1962 - Dec 1975');
figure(3);
plot(rho_x);
title('Correllogram of milk data from Jan 1962 - Dec 1975');
figure(4);
histogram(rho_x);
title('Correllogram of milk data from Jan 1962 - Dec 1975');
%% Dealing with trend
y(1) = x(1);
for i = 2:n
    y(i) = x(i) - x(i-1);
end
y_mean = mean(y);
y_variance = var(y);
y_std = std(y);
rho_y = correllogram(y);
figure(5);
plot(y);
title('Milk data from Jan 1962 - Dec 1975 after removing trend');
figure(6);
histogram(y);
title('Histogram of milk data from Jan 1962 - Dec 1975 after removing trend');
figure(7);
plot(rho_y);
title('Correllogram of milk data from Jan 1962 - Dec 1975 after removing trend');
figure(8);
histogram(rho_y);
title('Histogram of Correllogram of milk data from Jan 1962 - Dec 1975 after removing trend');
%% Dealing with seasonality
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
title('Milk data from Jan 1962 - Dec 1975 afer removing seasonality');
figure(10);
histogram(z);
title('Histogram of milk data from Jan 1962 - Dec 1975 afer removing seasonality');
figure(11);
plot(rho_z);
title('Correllogram of milk data from Jan 1962 - Dec 1975 afer removing seasonality');
figure(12);
histogram(rho_z);
title('Histogram of Correllogram of milk data from Jan 1962 - Dec 1975 afer removing seasonality');
%%
% Estimating the parameters of Multiplicative seasonal model
model = arima('Constant',0,'ARLags',1,'SARLags',12,'D',1,...
            'Seasonality',12,'MALags',1,'SMALags',12)
EstMdl = estimate(model,x');