%% Bisection Method with the use of derivatives
% Function that returns 'a_i', 'b_i', which are the end points of the 
% interval given, with a<b, the number of iterations 'iter',
% and the search range 'l' respectively. 
% The inputs are the function 'f', 'l' which was discussed previously 
% and the starting points a,b

% The minimum point x wasn't needed for the Task, so it's omitted
function [a_i,b_i,iter,l] = bisectionMethodWD(f,l,a,b)
    % Initialize variables according to the input of a,b given
    a_i = (a);
    b_i = (b);
    
    % Number of iteration we are in
    iter = 1;
    
    % Number of repetitions
    n = 0;
    
    % Finding the number of repetitions
    while(true)
        if (1/2)^n <= l/(b_i(iter) - a_i(iter))
            break
        else
            n = n + 1;
        end
    end
    
    % Making x our variable and taking the derivative of f 
    % I used matlabFunction because I had a bug afterwards on
    % fdot(xk), where I couldn't place a value on fdot
    syms x;
    fdot = matlabFunction(diff(f));
    
    % For every 
    for iter = 1:n
        % Calculates the aptitude of the discent
        xk = (a_i(iter)+b_i(iter))/2;
        % Comparing every instance of fdot(xk)
        if fdot(xk) == 0
            break;            
        elseif fdot(xk) > 0 
            a_i = [a_i a_i(iter)];
            b_i = [b_i xk];
        else
            a_i = [a_i xk];
            b_i = [b_i b_i(iter)];
        end
    end   
end