% In this script there are the results and plots of the way, the method Steepest Descent
% chose to minimize the function.
% There are 8 figures created:
% 4 of them represent the way, Steepest Descent Method takes to find the
% minimum f(xk)
% the rest of them the contours of f
clear;
close all;
clc;

%% Initializing of the variables
syms x y
f = @(x, y) (1/3)*(x.^2) + 3*(y.^2);
f_grad = gradient(f, [x, y]);
e = 0.001;
g = [0.1 0.3 3 5];
methodOfGamma = 1;     % fixed gamma
methods = "constant";


% The starting points according to the Task
x = 4;          % arbitrary 
y = -4;         % arbitrary      
limit = 500;    % arbitrary

for i = 1:length(g)
    fprintf("Steepest Descent Method!!!\nMethod of calculating gamma being %s.\n", methods); 
    fprintf("Gamma value is %1.1f!!!\n\n", g(i)); 
    
    %% Printing the values that we got from the function
    fprintf("The starting points used are (%d,%d).\n", x,y ); 
    tic
    [xk,k(i),X,Y] = steepestDescent(f,f_grad,e,g(i),x,y,methodOfGamma,limit);
    toc
    fprintf("The method lasted for k = %d steps.\n", k(i));      
    fprintf("The minimum value of f(xk) = %1.3f.\n\n\n", f(xk(1),xk(2)));   
    
    if length(X) < 2
            continue;
    else
        %% Minimum of f in 2D
        % Customizing the figure to be in the center of the screen with
        % some adjusted coordinates and size
        FigH = figure;
        FigH.Position = [500 -200 900 700];
        movegui(FigH,'center');
        set(FigH, 'NumberTitle','off','Name',sprintf('Steepest Descent Method with method of calculating gamma being %s', methods(methodOfGamma)));

        % Plot the f(X) in respect of Y
        plot(f(X(1:k(i)), Y(1:k(i))),'om-', 'MarkerFaceColor','k');           
        title(["Steepest Descent Method with starting points ("+ x+ ","+y+ ")" 
            "The method of calculating gamma is " + methods
            "The value of gamma is " + g(i)])
        xlabel('# of iteration k')
        ylabel('f(xk,yk)')

        %% The Contour of f
        % Customizing the figure to be in the center of the screen with
        % some adjusted coordinates and size
        FigH2 = figure;
        FigH2.Position = [500 -200 900 700];
        movegui(FigH2,'center');
        set(FigH2, 'NumberTitle','off','Name',sprintf('Contours of f using the Steepest Descent Method and the method of calculating gamma being %s', methods(methodOfGamma)));

        % Plot the contours of f
        fcontour(f)
        hold on;
        grid on;
        colorbar
        plot(X,Y,'om-', 'MarkerFaceColor','k');
        title(["Contour of f with starting points ("+ x+ ","+y+ ") and using the Steepest Descent Method" 
            "The method of calculating gamma is " + methods
            "The value of gamma is " + g(i)])
        xlabel('x')
        ylabel('y')
    end
end