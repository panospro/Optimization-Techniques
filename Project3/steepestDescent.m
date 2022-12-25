%% Steepest Descent Method
% Function that returns the minimum point, 'xk', the number of iterations,
% 'k' and two arrays that store the values of x,y, 'X', 'Y' respectively.
% The inputs are the function, 'f', the gradient of the function, 'f_grad',
% the starting points, 'x0', 'y0', the method that we calculate the value of 
% gamma, 'methodofGamma'  and the limit of the iterations, 'limit', so that 
% we don't have long time calculations.
function [xk,k,X,Y] = steepestDescent(f,f_grad,e,gamma,x0,y0,methodOfGamma,limit)
    % Initialize variables according to the input of x0,y0 given,
    % storing x,y to X,Y accordingly, calculating the grad(f(xk))
    % and giving an initial interval for a,b for the second method of
    % caltulating the value of gamma.
    syms x y
    k = 1; 
    xk = [x0; y0];
    x = xk(1);
    y = xk(2);
    X= [x]; 
    Y= [y];
    f_gradient = subs(f_grad);
    a = 0;    
    b = 10; 
    lamda = 0.001;
    
    % According to what methodOfGamma we choose, the program calculates the
    % value of gamma
    switch methodOfGamma
        case 1 
            % The termination condition being |gradf(x_k)|<= epsilon, also
            % adding the limit to minimize the calculation time
            while  norm(f_gradient) > e && k < limit
                % Initializing the value of dk
                dk = -f_gradient; 
                
                % Make xk double,because if we check what value it gets
                % a lot of exp value and that slows down the calculation time
                % and we store the values of x,y,X,Y
                xk = double(xk + gamma.*dk);   
                x = xk(1);
                y = xk(2);
                X = [X x];
                Y = [Y y];
                
                % Changing the value of the gradient back to the previous value         
                f_gradient = subs(f_grad);
                k = k+1;     
            end

        case 2
            syms gk
            
            % The termination condition being |gradf(x_k)|<= epsilon, also
            % adding the limit to minimize the calculation time
            while  norm(f_gradient) > e && k < limit
                % Initializing the value of dk
                dk = -f_gradient;
                
                % Finding gamma, so that it minimizes f(xk+gamma*dk) using the
                % Golden Section Algorithm from the 1st project. 
                % gammaMin is the value of gamma that minimizes f(xk+gamma*dk)
                fgold(gk) = f(xk(1) + gk*dk(1), xk(2) + gk*dk(2));
                gammaMin = goldMethod(fgold,lamda,a,b);
  
                % We make xk double,because if we check what value it gets
                % a lot of exp value and that slows down the calculation time
                % and we store the values of x,y,X,Y
                xk = double(xk + gammaMin.*dk);   
                x = xk(1);
                y = xk(2);
                X = [X x];
                Y = [Y y];
                
                % Changing the value of the gradient back to the previous value         
                f_gradient = subs(f_grad);
                k = k+1;  
            end
                        
        case 3
            % Initialize the armijo algorithm constants, which must follow
            % the constrain 0<a<b<1
            mk = 0;
            a = 0.1;
            b = 0.5;
            s = gamma * b^(-mk);
            
            % The termination condition being |gradf(x_k)|<= epsilon, also
            % adding the limit to minimize the calculation time
            while  norm(f_gradient) > e && k < limit
                % Initializing the value of dk
                dk = -f_gradient;
                
                % xk1 is x_(k+1) = xk - �_k*gradf(x_k) = xk + �_k*dk 
                xk1 = double(xk + gamma.*dk); 
                
                % Finding m_k with the termination condition being
                % f(x_k+1)<= f(x_k)+a*�_k*d_k*gradf(x_k)
                while  f(xk1(1), xk1(2)) > f(xk(1), xk(2)) +a*b^mk*s*(dk*dk')
                    mk = mk + 1;
                    % Setting the value of gamma according to theory
                    gamma = s*b^mk;
                end
                
                % We make xk double,because if we check what value it gets
                % a lot of exp value and that slows down the calculation time
                % and we store the values of x,y,X,Y
                xk = double(xk + gamma.*dk);   
                x = xk(1);
                y = xk(2);
                X = [X x];
                Y = [Y y];
                
                % Changing the value of the gradient back to the previous value         
                f_gradient = subs(f_grad);
                k = k+1;  
            end     
    end
end