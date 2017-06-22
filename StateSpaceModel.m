function StateSpaceModel
n = 20;
vari = 1;
j =0;
er= normrnd(0,vari,n,1);
for i = 1:n
    t(i) = i;
end
phi1 = -0.35;
phi2 = 0.5;
theta = 0.9;
y(1) = normrnd(0,vari);
y(2) = normrnd(0,vari);
for i = 3:n
    y(i) = (phi1*y(i-1)) +(phi2*y(i-2)) + er(i) + (theta *er(i-1));
end
F = [phi1 phi2 ; 1 0];
H = [1 ; theta];
Q = [0.234 0 ; 0 0.489];
R = 0.269;
et = zeros(2,n);
ett1 = zeros(2,n);
et(:,1) = [1 ; 1];
pt = zeros(2,2*n);
ptt1 = zeros(2,2*n);
pt(:,1:2) = [0.5 0 ; 0 0.5];
for i = 2:n
  ett1(:,i-1) = F * et(:,i-1);
  ptt1(:,i-1:i) = (F * pt(:,i-1:i) * F') + Q;
  et(:,i) = et(:,i-1)+ (ptt1(:,i-1:i)* H * ((H'*ptt1(:,i-1:i)*H)+R) *(y(i)-(H'*ett1(:,i-1))));
  pt(:,i+1:i+2) = ptt1(:,i-1:i) - (ptt1(:,i-1:i)*H*((H'*ptt1(:,i-1:i)*H)+R)*H'*ptt1(:,i-1:i)); 
end
for i = 0:n-1
    j = (2*i)+1;
    pte1(i+1) = pt(1,j);
    pte3(i+1) = pt(2,j);
    ptt1e1(i+1) = ptt1(1,j);
    ptt1e3(i+1) = ptt1(2,j);
end

for i = 1:n
    j = (2*i);
    pte2(i) = pt(1,j);
    pte4(i) = pt(2,j);
    ptt1e2(i) = ptt1(1,j);
    ptt1e4(i) = ptt1(2,j);
end
figure(1);
plot(t,et(1,:),t,et(2,:));
title('Plot of two components of vector et given t');
figure(2);
plot(t,ett1(1,:),t,ett1(2,:));
title('Plot of two components of the vector et given t-1');
figure(3);
plot(t,pte1,t,pte2,t,pte3,t,pte4);
title('Plot of four components of the matrix P given  t');
figure(4);
plot(t,ptt1e1,t,ptt1e2,t,ptt1e3,t,ptt1e4)
title('Plot of four components of the matrix P given t-1');
display(eig(F));
end