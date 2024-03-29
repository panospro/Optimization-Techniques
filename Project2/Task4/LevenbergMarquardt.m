%% Levenberg-Marquardt Method
% Function that returns the minimum point, 'xk', the number of iterations,
% 'k' and two arrays that store the values of x,y, 'X', 'Y' respectively.
% The inputs are the function, 'f', the gradient of the function, 'f_grad',
% the hessian of the function, 'f_hess', the starting points, 'x0', 'y0', 
% the method that we calculate the value of gamma, 'methodofGamma'  and the
% limit of the iterations, 'limit', so that we don't have long time calculations 
% and last but not least the increment of the eigen value if the hessian is not 
% positively defined, 'step'.
function [xk,k,X,Y] = LevenbergMarquardt(f,f_grad,f_hess,e,gamma,x0,y0,methodOfGamma,limit,step)
    % Initialize variables according to the input of x0,y0 given,
    % storing x,y to X,Y accordingly, calculating the grad(f(xk)) and 
    % hess(f(xk)) and giving an initial interval for a,b for the 
    % second method of caltulating the value of gamma.
    syms x y
    k = 1; 
    xk = [x0; y0];
    x = xk(1);
    y = xk(2);
    X=[]; 
    Y=[];
    f_gradient = subs(f_grad);
    f_hessian = subs(f_hess);
    a = 0;    
    b = 10; 
    lamda = 0.001;
    
    % Calculate the hessian and its eigen values and checking if it's
    % positively defined, if it's not, we add a small increment to the max
    % eigen value to make it so.
    maxEigenValue = max(abs(eig(f_hessian)));
    % eye(2), because the hessian is a function of x,y so it need a 2x2 matrix
    hessianWithMaxEigenValue = f_hessian + maxEigenValue.*eye(2);
    while ((det(hessianWithMaxEigenValue) <= 0) || (hessianWithMaxEigenValue(1,1)<=0)) 
        maxEigenValue = maxEigenValue + step;
        hessianWithMaxEigenValue = f_hessian + maxEigenValue.*eye(2);
    end
      
    % According to what methodOfGamma we choose, the program calculates the
    % value of gamma
    switch methodOfGamma
        case 1 
            % The termination condition being |gradf(x_k)|<= epsilon, also
            % adding the limit to minimize the calculation time
            while  norm(f_gradient) > e && k < limit
                % The new hessian determinant and sub-determinants have to be
                % greater than 0, so the hessian of f is positively defined
                if (det(hessianWithMaxEigenValue) > 0  && hessianWithMaxEigenValue(1,1) > 0) >0
                    % Initializing the value of dk
                    dk = -inv(hessianWithMaxEigenValue)*f_gradient;                     

                    % Make xk double,because if we check what value it gets
                    % a lot of exp value and that slows down the calculation time
                    % and we store the values of x,y,X,Y
                    xk = double(xk + gamma.*dk);   
                    x = xk(1);
                    y = xk(2);
                    X = [X x];
                    Y = [Y y];

                    % Changing the value of the gradient,and the hessian
                    % back to the previous value         
                    f_gradient = subs(f_grad);
                    f_hessian = subs(f_hess);
                    
                    % Calculate the hessian and its eigen values and checking if it's
                    % positively defined, if it's not, we add a small increment to the max
                    % eigen value to make it so.
                    maxEigenValue = max(abs(eig(f_hessian)));
                    % eye(2), because the hessian is a function of x,y so it need a 2x2 matrix                
                    hessianWithMaxEigenValue = f_hessian + maxEigenValue.*eye(2);
                    while ((det(hessianWithMaxEigenValue) <= 0) || (hessianWithMaxEigenValue(1,1)<=0)) 
                        maxEigenValue = maxEigenValue + step;
                        hessianWithMaxEigenValue = f_hessian + maxEigenValue.*eye(2);
                    end
                    k = k+1; 
                else 
                    % If the hessian of f is not positively defined, there can't
                    % be the inverse hessian of f, so we break out of the loop.
                    fprintf("Unfortunately the method had to stop, because the hessian is not positively defined!\n");
                end
            end

        case 2
            syms gamma
            
            % The termination condition being |gradf(x_k)|<= epsilon, also
            % adding the limit to minimize the calculation time
            while  norm(f_gradient) > e && k < limit
                % The new hessian determinant and sub-determinants have to be
                % greater than 0, so the hessian of f is positively defined
                if (det(hessianWithMaxEigenValue) > 0  && hessianWithMaxEigenValue(1,1) > 0) 
                    % Initializing the value of dk
                    dk = -inv(hessianWithMaxEigenValue)*f_gradient; 

                    % Finding gamma, so that it minimizes f(xk+gamma*dk) using the
                    % Golden Section Algorithm from the 1st project. 
                    % gammaMin is the value of gamma that minimizes f(xk+gamma*dk)
                    fgold(gamma) = f(xk(1) + gamma*dk(1), xk(2) + gamma*dk(2));
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
                    f_hessian = subs(f_hess);
                    
                    % Calculate the hessian and its eigen values and checking if it's
                    % positively defined, if it's not, we add a small increment to the max
                    % eigen value to make it so.
                    maxEigenValue = max(abs(eig(f_hessian))); 
                    % eye(2), because the hessian is a function of x,y so it need a 2x2 matrix              
                    hessianWithMaxEigenValue = f_hessian + maxEigenValue.*eye(2);
                    while ((det(hessianWithMaxEigenValue) <= 0) || (hessianWithMaxEigenValue(1,1)<=0)) 
                        maxEigenValue = maxEigenValue + step;
                        hessianWithMaxEigenValue = f_hessian + maxEigenValue.*eye(2);
                    end
                    k = k+1;
                else 
                    % If the hessian of f is not positively defined, there can't
                    % be the inverse hessian of f, so we break out of the loop.
                    fprintf("Unfortunately the method had to stop, because the hessian is not positively defined!\n");
                end
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
                % The new hessian determinant and sub-determinants have to be
                % greater than 0, so the hessian of f is positively defined
                if (det(hessianWithMaxEigenValue) > 0  && hessianWithMaxEigenValue(1,1) > 0) 
                    % Initializing the value of dk
                    dk = -inv(hessianWithMaxEigenValue)*f_gradient; 

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
                    f_hessian = subs(f_hess);
                    
                    % Calculate the hessian and its eigen values and checking if it's
                    % positively defined, if it's not, we add a small increment to the max
                    % eigen value to make it so.
                    maxEigenValue = max(abs(eig(f_hessian)));
                    % eye(2), because the hessian is a function of x,y so it need a 2x2 matrix             
                    hessianWithMaxEigenValue = f_hessian + maxEigenValue.*eye(2);
                    while ((det(hessianWithMaxEigenValue) <= 0) || (hessianWithMaxEigenValue(1,1)<=0)) 
                        maxEigenValue = maxEigenValue + step;
                        hessianWithMaxEigenValue = f_hessian + maxEigenValue.*eye(2);
                    end
                    k = k+1;
                else 
                    % If the hessian of f is not positively defined, there can't
                    % be the inverse hessian of f, so we break out of the loop.
                    fprintf("Unfortunately the method had to stop, because the hessian is not positively defined!\n");
                end
            end     
    end
end