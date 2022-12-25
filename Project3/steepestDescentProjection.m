%% Steepest Descent Method with Projection
% Function that returns the minimum point, 'xk', the number of iterations,
% 'k' and two arrays that store the values of x,y, 'X', 'Y' respectively.
% The inputs are the function, 'f', the gradient of the function, 'f_grad',
% the starting points, 'x0', 'y0', the limit of the iterations, 'limit',
% the constrains of the problem, 'Constr' and a positive value sk.
function [xk,k,X,Y] = steepestDescentProjection(f,f_grad,e,gamma,x0,y0,limit,Constr,sk)
    % Initialize variables according to the input of x0,y0 given,
    % storing x,y to X,Y accordingly, calculating the grad(f(xk))
    syms x y
    k = 1; 
    xk = [x0; y0];
    x = xk(1);
    y = xk(2);
    X=[x]; 
    Y=[y];
    f_gradient = subs(f_grad);
    
    % By initializing xkbar we reduse the number of extra iterations 
    xkbar = zeros(2, 1);
    
    % The function we need to project
    z = xk - sk.* f_gradient;
    
    % The projection of the function
    xkbar = max(Constr(:, 1), min(z, Constr(:, 2)));
    
    % The termination condition being |gradf(x_k)|<= epsilon, also
    % adding the limit to minimize the calculation time
    while  norm(xk - xkbar) > e && k < limit
        % Make xk double,to speed up the calculation time.
        xk = double(xk + gamma.*(xkbar - xk)); 
        
        % Changing the value of the gradient,z and xkbar back to
        % the previous value and store x,y 
        x = xk(1);
        y = xk(2);
        f_gradient = subs(f_grad);
        xkbar = zeros(2, 1);
        z = xk - sk.* f_gradient;
        xkbar = max(Constr(:, 1), min(z, Constr(:, 2)));
        
        % Store the values of X,Y.
        X = [X x];
        Y = [Y y];
        k = k + 1;    
    end
end