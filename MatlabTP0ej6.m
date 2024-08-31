%% Punto 6
close all;
clear;
clc;
N = 10000000;
% Item a)
maxX1 = 1100;
minX1 = 1000;
X1 = minX1 + (maxX1-minX1) .* rand(N,1);

maxX2 = 600;
minX2 = 500;
X2 = minX2 + (maxX2-minX2) .* rand(N,1);

X = [X1,X2];

% Item b)

nbinsx1 = 75;
nbinsx2 = 75;
X1_max = max(X1);
X1_min = min(X1);
dX1 = (X1_max - X1_min)/nbinsx1;
X2_max = max(X2);
X2_min = min(X2);
dX2 = (X2_max - X2_min)/nbinsx2;

fX1X2e = hist3(X, [nbinsx1 nbinsx2])/(dX1*dX2*N);
fX1X2 = 1/10000 * ones([nbinsx1, nbinsx2]);

% Item c)
x1 = X1_min:dX1:X1_max - dX1;
x2 = X2_min:dX2:X2_max - dX2;
[x1,x2] = meshgrid(x1, x2);
mesh(x1, x2, fX1X2e);
hold on;
mesh(x1, x2, fX1X2, EdgeColor="k");

% Item d)
M = [[3,2];[2,2]];
Y = M*X';
Y1 = Y(1,:);
Y2 = Y(2,:);

nbinsy1 = 75;
nbinsy2 = 75;
Y1_max = max(Y1);
Y1_min = min(Y1);
dY1 = (Y1_max - Y1_min)/nbinsy1;
Y2_max = max(Y2);
Y2_min = min(Y2);
dY2 = (Y2_max - Y2_min)/nbinsy2;

figure;
fY1Y2e = hist3(Y', [nbinsy1 nbinsy2])/(dY1*dY2*N);

y1 = Y1_min:dY1:Y1_max - dY1;
y2 = Y2_min:dY2:Y2_max - dY2;
[y1,y2] = meshgrid(y1, y2);
mesh(y1, y2, fY1Y2e);

%Item e)
figure;
contour(y1,y2,fY1Y2e)
axis([3900 4600 2900 3500]);

%Item f)
P1 = length(find( (Y1>4300) & (Y1<4500)))/N;
P2 = length(find( (Y2>3000) & (Y2<3200)))/N;

%Item g)
fX1 = 1/100;
fX2 = 1/100;
Y1 = 3.*X1 + 2.*X2;
Y2 = 2.*X1 + 2.*X2;

mean(X1);
mean(X2);
mean(Y1);
mean(Y2);