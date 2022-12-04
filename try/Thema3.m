% In this script there are the results and plots of the way, the method Newton
% chose to minimize the function.
% There are 0 figures created and that's, because in every example the
% hessian matrix is not positively defined. 
clc;
clear;
close all;

%% Initializing of the variables
syms x y
f = @(x, y) (x.^5).* exp(-(x.^2)-(y.^2));
f_grad = gradient(f, [x, y]);
f_hess = hessian(f, [x, y]);
e = 0.01;    %arbitrary
g = 0.1;     %arbitrary

% The starting points according to the Task
x = [0 -1 1];
y = [0 1 -1];
limit = 500;    %arbitrary

% The name of the methods
methods = ["'constant'"; " 'minimum of the function f(xk+gk*dk)'"; "'armijo'"];

for methodOfGamma = 1:length(methods)
    fprintf("Newton Method!!!\nMethod of calculating gamma being %s.\n\n\n", methods(methodOfGamma)); 
    for i= 1:length(x)
        %% Printing the values that we got from the function
        fprintf("The starting points used are (%d,%d).\n", x(i),y(i)); 
        tic
        [xk,k(i),X,Y] = Newton(f,f_grad,f_hess,e,g,x(:,i),y(:,i),methodOfGamma,limit);
        toc
        fprintf("The method lasted for k = %d steps.\n", k(i));      
        fprintf("The minimum value of f(xk) = %1.3f.\n\n", f(xk(1),xk(2)));
       
        %% Graphical representations
        % Only for length(X)=> 3, because if the method lasted only for 2
        % steps, then in the plot there will be only 1 element and we
        % wouldn't be able to observe what happened. So the other ones are
        % ommited
        if length(X) < 2
            continue;
        else
            % Customizing the figure to be in the center of the screen with
            % some adjusted coordinates and size
            FigH = figure;
            FigH.Position = [500 -200 900 700];
            movegui(FigH,'center');
            set(FigH, 'NumberTitle','off','Name',sprintf('Newton Method with method of calculating gamma being %s', methods(methodOfGamma)));
            
            % Plot the f(X) in respect of Y
            plot(f(X(1:k(i)-1), Y(1:k(i)-1)),'om-', 'MarkerFaceColor','k');           
            title(["Newton Method with starting points ("+ x(i)+ ","+y(i)+ ")" 
                "The method of calculating gamma is " + methods(methodOfGamma)])
            xlabel('# of iteration k')
            ylabel('f(xk,yk)')
                             
            %% The Contour of f
            % Customizing the figure to be in the center of the screen with
            % some adjusted coordinates and size
            FigH2 = figure;
            FigH2.Position = [500 -200 900 700];
            movegui(FigH2,'center');
            set(FigH2, 'NumberTitle','off','Name',sprintf('Contours of f using the Newton Method and the method of calculating gamma being %s', methods(methodOfGamma)));
            
            % Plot the contours of f
            fcontour(f)
            hold on;
            grid on;
            colorbar
            plot(X,Y,'om-', 'MarkerFaceColor','k');
            title(["Contour of f with starting points ("+ x(i)+ ","+y(i)+ ") and using the Newton Method" 
                "The method of calculating gamma is " + methods(methodOfGamma)])
            xlabel('x')
            ylabel('y')
        end  
    end
    fprintf("\n\n\n")
end