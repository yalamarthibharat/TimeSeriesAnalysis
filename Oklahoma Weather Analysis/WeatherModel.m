n = length(TAIR_20);
n_Wind = length(Wind);
for i = 1:n
    x(i) = i;
end
figure(1);
plot(x,TAIR_20,x,TAIR_21);
legend('January 20', 'January 21');
title('Temperature Time Series');
figure(2);
plot(x,PRES_20,x,PRES_21);
legend('January 20', 'January 21');
title('Pressure Time Series');
figure(3);
plot(Wind);
title('Wind Time Series');
%%
% Calculating means
temp_TAIR_20 = 0;
temp_TAIR_21 = 0;
temp_PRES_20 = 0;
temp_PRES_21 = 0;
temp_Wind = 0;
for i = 1:n
    temp_TAIR_20 = temp_TAIR_20 + TAIR_20(i);
    temp_TAIR_21 = temp_TAIR_21 + TAIR_21(i);
    temp_PRES_20 = temp_PRES_20 + PRES_20(i);
    temp_PRES_21 = temp_PRES_21 + PRES_21(i);
end

for j = 1:n_Wind
    temp_Wind = temp_Wind + Wind(j);
end
TAIR_20_mean = temp_TAIR_20/n;
TAIR_21_mean = temp_TAIR_21/n;
PRES_20_mean = temp_PRES_20/n;
PRES_21_mean = temp_PRES_21/n;
Wind_mean = temp_Wind/n_Wind;
%display(TAIR_20_mean);
%display(TAIR_21_mean);
%display(PRES_20_mean);
%display(PRES_21_mean);
%display(Wind_mean);
%%
% sd Calculation
TAIR_20_sd = std(TAIR_20);
TAIR_21_sd = std(TAIR_21);
PRES_20_sd = std(PRES_20);
PRES_21_sd = std(PRES_21);
Wind_sd = std(Wind);
%%
% Calculating Anamolies
TAIR_20_anamoly = TAIR_20 - TAIR_20_mean;
TAIR_21_anamoly = TAIR_21 - TAIR_21_mean;
PRES_20_anamoly = PRES_20 - PRES_20_mean;
PRES_21_anamoly = PRES_21 - PRES_21_mean;
Wind_anamoly = Wind - Wind_mean;

figure(4);
plot(x,TAIR_20_anamoly,x,TAIR_21_anamoly);
legend('January 20', 'January 21');
title('Temperature Anamolies');
figure(5);
plot(x,PRES_20_anamoly,x,PRES_21_anamoly);
legend('January 20', 'January 21');
title('Pressure Anamolies');
figure(6);
plot(Wind_anamoly);
title('Wind Anamolies');
%% 
% Normalised Vectors
TAIR_20_anamoly_normalized = TAIR_20_anamoly/TAIR_20_sd;
TAIR_21_anamoly_normalized = TAIR_21_anamoly/TAIR_21_sd;
PRES_20_anamoly_normalized = PRES_20_anamoly/PRES_20_sd;
PRES_21_anamoly_normalized = PRES_21_anamoly/PRES_21_sd;
Wind_anamoly_normalized = Wind_anamoly/Wind_sd;
%%
% Corellograms

C_TAIR_20(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+(TAIR_20_anomaly(j)*TAIR_20_anomaly(j-i));
    end
    C_TAIR_20(i)=temp/(n+i);
end
rho_TAIR_20(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+ (TAIR_20_anamoly_normalized(j)*TAIR_20_anamoly_normalized(j-i));
    end
    rho_TAIR_20(i)=temp/(n+i);
end
%%

C_TAIR_21(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+(TAIR_21_anomaly(j)*TAIR_21_anomaly(j-i));
    end
    C_TAIR_21(i)=temp/(n+i);
end
rho_TAIR_21(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+ (TAIR_21_anamoly_normalized(j)*TAIR_21_anamoly_normalized(j-i));
    end
    rho_TAIR_21(i)=temp/(n+i);
end

%%
C_PRES_20(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+(PRES_20_anomaly(j)*PRES_20_anomaly(j-i));
    end
    C_PRES_20(i)=temp/(n+i);
end
rho_PRES_20(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+ (PRES_20_anamoly_normalized(j)*PRES_20_anamoly_normalized(j-i));
    end
    rho_PRES_20(i)=temp/(n+i);
end
%%
C_PRES_21(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+(PRES_21_anomaly(j)*PRES_21_anomaly(j-i));
    end
    C_PRES_21(i)=temp/(n+i);
end
rho_PRES_21(1)=0;
for i=1:n
    temp=0;
    for j=i+1:n
        temp=temp+ (PRES_21_anamoly_normalized(j)*PRES_21_anamoly_normalized(j-i));
    end
    rho_PRES_21(i)=temp/(n+i);
end
%%
C_Wind(1)=0;
for i=1:n_Wind
    temp=0;
    for j=i+1:n_Wind
        temp=temp+(Wind_anamoly(j)*Wind_anamoly(j-i));
    end
    C_Wind(i)=temp/(n_Wind+i);
end
rho_Wind(1)=0;
for i=1:n_Wind
    temp=0;
    for j=i+1:n_Wind
        temp=temp+ (Wind_anamoly_normalized(j)*Wind_anamoly_normalized(j-i));
    end
    rho_Wind(i)=temp/(n_Wind+i);
end

figure(7);
plot(x,rho_TAIR_20,x,rho_TAIR_21);
legend('January 20', 'January 21');
title('Temperature Corellogram');
figure(8);
plot(x,rho_PRES_20,x,rho_PRES_21);
legend('January 20', 'January 21');
title('Pressure Corellogram');
figure(9);
plot(rho_Wind);
title('Wind Corellogram');