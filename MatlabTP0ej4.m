%%
close all;
clear;
clc;
n = 1000000;
X1 = rand(n,1);
X1_max = max(X1);
X1_min = min(X1);
nbins = 1000;
dX1 = (X1_max - X1_min)/nbins;
h = hist(X1, nbins);
fX1e = h/(dX1*length(X1));
x1 = X1_min:dX1:X1_max - X1_min;

% Graficar la densidad experimental
figure;
plot(x1,fX1e, '-r');
xlabel('X1');
ylabel('f_{X1e}');
title('Gráfico I');
axis([0 1 0.5 1.5]); % Ajustar los límites del eje x y del eje y
hold on;
fx1 = 1;
plot(x1,fx1*ones(size(x1)), '-b');

Y1 = X1*pi*3/2 - pi/2;
fy1 = 2/(3*pi);


figure;
plot(Y1, fy1*ones(size(Y1)), '-b');
hold on;
xlabel('Y1');
ylabel('f_{Y1e}');
title('Gráfico II');
axis([-pi/3 pi 0 0.5]); % Ajustar los límites del eje x y del eje y
Y1_e = -pi/2 + (pi + pi/2) * rand(n, 1);
Y1_max = max(Y1_e);
Y1_min = min(Y1_e);
dY1 = (Y1_max - Y1_min)/nbins;
h_y = hist(Y1_e, nbins);
fY1e = h_y/(dY1*length(Y1_e));
y1 = linspace(Y1_min, Y1_max, nbins);
plot(y1,fY1e, '-y');


esperanza_X1= mean(X1)
esperanza_Y1 = mean(Y1)
varianza_X1= var(X1)
varianza_Y1= var(Y1)

% f)

figure;
xlabel('Y2');
ylabel('f_{Y2}');
title('Gráfico III');
X2 = Y1;
Y2 = sin(X2);
X2_e = Y1_e;
Y2_e = sin(X2_e);
Y2_max = max(Y2);
Y2_min = min(Y2);
dY2 = (Y2_max - Y2_min)/nbins;
h_y2 = hist(Y2, nbins);
fY2e = h_y/(dY2*length(Y2_e));
y2a = -0.99:0.01:0;
y2b = 0:0.01:0.99;
fy2a = 2./(pi*3*sqrt(1-y2a.^2));
fy2b = 4./(pi*3*sqrt(1-y2b.^2));
plot(y2a, fy2a);
hold on;
plot(y2b, fy2b);
hold on;
plot(Y2_e, fY2e);

axis([-1.5 1.5 -1 1]); % Ajustar los límites del eje x y del eje y
%plot(Y2, (2/(pi*3))/((1-Y2.*Y2).^(1/2)))








