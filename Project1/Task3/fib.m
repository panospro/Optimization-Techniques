%% Fibonacci Method 
% Function that returns 'a_i', 'b_i', which are the end points of the 
% interval given, with a<b, the number of iterations 'iter',
% and the search range 'l' respectively. 
% The inputs are the function 'f', 'l' which was discussed previously 
% and the starting points a,b

% The minimum point x wasn't needed for the Task, so it's omitted
function [a_i,b_i,iter,l] = fib(f,l,a,b)
    % Initialize variables according to the input of a,b given
    a_i = (a);
    b_i = (b);
    
    % Number of iteration we are in
    iter = 1;
    
    % Number of repetitions
    n = 0;
    
    % The fibonacci array (using this way instead of using for example the
    % 'fibonacci' function that matlab has or creating a new function to
    % use,we have the highest performance
    F = [1 ,1];
    
    % Finding the number of repetitions
    while ((b_i(1)-a_i(1))/l)>F(end)
        F(end + 1) = F(end) + F(end - 1);
    end
      
    n = length(F);

    %The first and second elements
    x1 = a_i(iter) + (F(n-iter-1)./F(n-iter+1)).* (b_i(iter) - a_i(iter));
    x2 = a_i(iter) + (F(n-iter-2)./F(n-iter-1)) .* (b_i(iter) - a_i(iter)); 
    
    % While b-a>l being the terminal condition
    while b_i(iter) - a_i(iter)> l   
        iter= iter + 1;  % increasing the step by 1     
        
        % If we are in the n-2 iteration we go out of the loop
        if (iter == n-2)
            break;
        % Else we compare f(x1) and f(x2)
        elseif f(x1) > f(x2)
            a_i = [a_i, x1];
            b_i = [b_i, b_i(iter-1)];
            x1 = x2;
            x2 = a_i(iter) + (F(n-iter-1)/F(n-iter)) * (b_i(iter) - a_i(iter));
        else 
            a_i = [a_i, a_i(iter-1)];
            b_i = [b_i, x2];
            x2 = x1;
            x1 = a_i(iter) + (F(n-iter-2)/F(n-iter))* (b_i(iter) - a_i(iter));
        end    
    end
end