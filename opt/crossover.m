% parent1: first parent's decision variables (number of vehicles on each road)
% parent2: second parent's decision variables (number of vehicles on each road)
function [child1, child2] = crossover(parent1, parent2)
    % Take the length of parent1
    n = length(parent1);
    
    % Select a random crossover point
    crossover_point = round(unifrnd(1, n));
    
    % ;??
    % Create child1 by combining the first half of parent1 and the second half of parent2
    child1 = [parent1(1:crossover_point); parent2(crossover_point+1:end)];
    
    % Create child2 by combining the first half of parent2 and the second half of parent1
    child2 = [parent2(1:crossover_point); parent1(crossover_point+1:end)];
end