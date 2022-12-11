%% Golden section Method 
% Function that returns the minimum point xk. 
% The inputs are the function 'f', the search range 'l'
% and the starting points a,b
function xk = goldMethod(f,l,a,b)
    % Initialize variables according to the input of a,b given
    a_i = (a);
    b_i = (b);
    
    % Golden ration from 'wikipedia'
    gamma = (sqrt(5)-1)/2;
    
    % Number of iteration we are in
    iter = 1;
    
    %The first and second elements
    x1 = a_i(iter) + (1-gamma) * (b_i(iter) - a_i(iter));
    x2 = a_i(iter) + gamma * (b_i(iter) - a_i(iter)); 
    
    % While b-a>l being the terminal condition
    while b_i(iter) - a_i(iter)> l   
        iter= iter + 1;  % increasing the step by 1     
       
        if f(x1) > f(x2)
            a_i = [a_i, x1];
            b_i = [b_i, b_i(iter-1)];
            x1 = x2;
            x2 = a_i(iter) + gamma * (b_i(iter) - a_i(iter));
        else 
            a_i = [a_i, a_i(iter-1)];
            b_i = [b_i, x2];
            x2 = x1;
            x1 = a_i(iter) + (1-gamma) * (b_i(iter) - a_i(iter));
        end    
    end
    xk = (a_i(end) +b_i(end))/2;
end