% In this script there are the plots that represent the objective function.
% There are 3 figures created:
% one that shows the graphical representation of f(x,y) in 3D
% one that shows the contour and the quiver of f(x,y) in 2D
% and the last that shows both of the above combined in one 3D figure
clc;
clear;
close all;

%% The representation of the function in 3D
x = (-4:0.2:4);
y = x';
z = (x.^5).* exp(-(x.^2)-(y.^2));
figure('Name','The graphical representation of f(x,y)','NumberTitle','off');
surf(x,y,z);
colormap jet;
colorbar;
title("The function f(x,y) = $x^{5} e^{-x^2-y^2}$",'Interpreter', 'latex')
xlabel("x");
ylabel("y");
zlabel("f(x,y)");

%% The contour and quiver of the function in 2D
% Plots 10 contours and the quiver of f(x,y) over a grid from -4 to 4 in the x and y directions.
% Calculates the 2-D gradient of z using the gradient function.
% The gradient function returns u as the gradient in the x-direction
% and v as the gradient in the y-direction.
% Displays arrows indicating the gradient values using the quiver function
figure('Name','The contour and the quiver of f(x,y)','NumberTitle','off');
contour(x,y,z,10)
grid on;
hold on;
[u,v] = gradient(z,0.2,0.2);
quiver(x,y,u,v)
hold off;
title("The contour and quiver of the function f(x,y) = $x^{5} e^{-x^2-y^2}$",'Interpreter', 'latex')
xlabel('x');
ylabel('y');

%% The representation of the function in 3D, but with contour and quiver together
figure('Name','The graphical representation of f(x,y) with the contour and the quiver','NumberTitle','off');
surfc(x,y,z);
colormap jet;
colorbar;
title("The function f(x,y) = $x^{5} e^{-x^2-y^2}$ with the contour and the quiver",'Interpreter', 'latex')
xlabel("x");
ylabel("y");
zlabel("f(x,y)");
hold on;
contour(x,y,z,10)
grid on;
[u,v] = gradient(z,0.2,0.2);
quiver(x,y,u,v)
hold off;