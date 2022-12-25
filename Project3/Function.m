% In this script there are the plots that represent the objective function.
% There are 3 figures created:
% one that shows the graphical representation of f(x1,x2) in 3D
% one that shows the contour and the quiver of f(x1,x2) in 2D
% and the last that shows both of the above combined in one 3D figure
clc;
clear;
close all;

%% The representation of the function in 3D
x = (-4:0.2:4);
y = x';
z = (1/3)*(x.^2) + 3*(y.^2);
FigH1 = figure;
FigH1.Position = [500 -200 900 700];
movegui(FigH1,'center');
set(FigH1, 'NumberTitle','off','Name','The graphical representation of f(x1,x2)');
surf(x,y,z);
colormap jet;
colorbar;
title("The function $f(x_1,x_2)$ = $\frac{1}{3}x_1^{2} + 3x_2^{2}$",'Interpreter', 'latex')
xlabel("x");
ylabel("y");
zlabel("f(x_1,x_2)");
fileName = sprintf('function3d%d.png', 1); % create a file name for the current figure
saveas(gcf, fileName)
    
%% The contour and quiver of the function in 2D
% Plots 10 contours and the quiver of f(x1,x2) over a grid from -4 to 4 in the x and y directions.
% Calculates the 2-D gradient of z using the gradient function.
% The gradient function returns u as the gradient in the x-direction
% and v as the gradient in the y-direction.
% Displays arrows indicating the gradient values using the quiver function
FigH2 = figure;
FigH2.Position = [500 -200 900 700];
movegui(FigH2,'center');
set(FigH2, 'NumberTitle','off','Name','The contour and the quiver of f(x1,x2)');
contour(x,y,z,10)
grid on;
hold on;
[u,v] = gradient(z,0.2,0.2);
quiver(x,y,u,v)
hold off;
title("The contour and quiver of the function $f(x_1,x_2)$ = $\frac{1}{3}x_1^{2} + 3x_2^{2}$",'Interpreter', 'latex')
xlabel('x');
ylabel('y');

%% The representation of the function in 3D, but with contour and quiver together
FigH3 = figure;
FigH3.Position = [500 -200 900 700];
movegui(FigH3,'center');
set(FigH3, 'NumberTitle','off','Name','The graphical representation of f(x1,x2) with the contour and the quiver');
surfc(x,y,z);
colormap jet;
colorbar;
title("The function $f(x_1,x_2)$ = $\frac{1}{3}x_1^{2} + 3x_2^{2}$ with the contour and the quiver",'Interpreter', 'latex')
xlabel("x");
ylabel("y");
zlabel("f(x_1,x_2)");
hold on;
contour(x,y,z,10)
grid on;
[u,v] = gradient(z,0.2,0.2);
quiver(x,y,u,v)
hold off;