% In this script there are the results and plots of the way, the method Steepest Descent
% chose to minimize the function.
% There are 2 figures created:
% 1 of them represent the way, Steepest Descent Method takes to find the
% minimum f(xk)
% 1 of the contours of f
clear;
close all;
clc;

%% Initializing of the variables
syms x y
f = @(x, y) (1/3)*(x.^2) + 3*(y.^2);
f_grad = gradient(f, [x, y]);
e = 0.01;    
g = 0.2;     
methods = "constant";

% The starting points according to the Task
x = 8;
y = -10;
limit = 500;    %arbitrary
Constr = [-10 5; -8 12];
sk = 0.1;

%% Printing the values that we got from the function
fprintf("Steepest Descent Method!!!\nMethod of calculating gamma being %s.\n", methods); 
fprintf("Gamma value is %1.1f!!!\n\n", g); 
fprintf("The starting points used are (%d,%d).\n", x,y ); 
tic
[xk,k,X,Y] = steepestDescentProjection(f,f_grad,e,g,x,y,limit,Constr,sk);
toc
fprintf("The method lasted for k = %d steps.\n", k);      
fprintf("The minimum value of f(xk) = %1.3f.\n\n\n", f(xk(1),xk(2)));   

if length(X) > 2
    %% Minimum of f in 2D
    % Customizing the figure to be in the center of the screen with
    % some adjusted coordinates and size
    FigH = figure;
    FigH.Position = [500 -200 900 700];
    movegui(FigH,'center');
    set(FigH, 'NumberTitle','off','Name',sprintf('Steepest Descent Method with method of calculating gamma being %s', methods));

    % Plot the f(X) in respect of Y
    plot(f(X(1:k), Y(1:k)),'om-', 'MarkerFaceColor','k');           
    title(["Steepest Descent Method with starting points ("+ x+ ","+y+ ")" 
        "The method of calculating gamma is " + methods
        "The value of gamma is " + g])
    xlabel('# of iteration k')
    ylabel('f(xk,yk)')

    %% The Contour of f
    % Customizing the figure to be in the center of the screen with
    % some adjusted coordinates and size
    FigH2 = figure;
    FigH2.Position = [500 -200 900 700];
    movegui(FigH2,'center');
    set(FigH2, 'NumberTitle','off','Name',sprintf('Contours of f using the Steepest Descent Method and the method of calculating gamma being %s', methods));

    % Plot the contours of f
    fcontour(f)
    hold on;
    grid on;
    colorbar
    plot(X,Y,'om-', 'MarkerFaceColor','k');
    title(["Contour of f with starting points ("+ x+ ","+y+ ") and using the Steepest Descent Method" 
        "The method of calculating gamma is " + methods
        "The value of gamma is " + g])
    xlabel('x')
    ylabel('y')
end