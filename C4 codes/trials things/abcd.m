clear variables
clc; clf
k=1.5;
theta=linspace(0,8*pi,1000);
r=k*theta;
x=r.*cos(theta);
y=r.*sin(theta);
plot(x,y)
axis equal
grid on