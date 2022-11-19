%% Bisection Method without the use of derivatives
% Function that returns 'a_i', 'b_i', which are the end points of the 
% interval given, with a<b, the number of iterations 'iter',
% the distance from the bisector 'e' and the search range 'l' respectively. 
% The inputs are the function 'f', 'e' and 'l' which were discussed 
% previously and the starting points a,b

% The minimum point x wasn't needed for the Task, so it's omitted
function [a_i,b_i,iter,e,l] = bisectionMethod(f,e,l,a,b)
    % Initialize variables according to the input of a,b given
    a_i = (a);
    b_i = (b);

    % Number of iteration we are in
    iter = 1;
    
    % While b-a>l being the terminal condition
    while b_i(iter)-a_i(iter)>l
        x1 = (b_i(iter)+a_i(iter))/2 - e;             %The first element 
        x2 = (b_i(iter)+a_i(iter))/2 + e;             %The second element
        iter= iter + 1;                         % increasing the step by 1  
        
        if f(x1) > f(x2)
            a_i = [a_i, x1];
            b_i = [b_i, b_i(iter-1)];
        else 
            a_i = [a_i, a_i(iter-1)];
            b_i = [b_i, x2];
        end
    end
end