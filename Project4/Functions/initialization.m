% t: vector of fixed time required to move on each road
% a: vector of rate of passage of vehicles on each road
% c: vector of maximum rate of passage of vehicles on each road
function [x0, Aeq, beq, lb, ub] = initialization(t, a, c)
    % Initialize decision variables
    x0 = c./2; % Start with initial guess of half of maximum capacity
    
    % Define equality constraints
    % Sum of vehicles entering a node must be equal to the sum of vehicles exiting the node
    % Sum of vehicles entering a node = sum of vehicles exiting the node
    Aeq = [];
    beq = [];
    
    % Define lower and upper bounds
    lb = zeros(size(c)); % Lower bound of 0 on number of vehicles
    ub = c; % Upper bound of c on number of vehicles
end
