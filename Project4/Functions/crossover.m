% parent1: first parent's decision variables (number of vehicles on each road)
% parent2: second parent's decision variables (number of vehicles on each road)
function [child1, child2] = crossover(parent1, parent2)
    % Take the size of parent1
    n = size(parent1,1);
    m = size(parent1,2);
    
    % Select a random crossover point
    crossover_row = round(unifrnd(1, n));
    crossover_col = round(unifrnd(1, m));
    
    % Create child1 by combining a random crossover point from parent1 to parent2
    child1 = [parent1(1:crossover_row,1:crossover_col,:) parent2(1:crossover_row,crossover_col+1:m,:) ; parent2(crossover_row+1:n,1:crossover_col,:) parent1(crossover_row+1:n,crossover_col+1:m,:)];
    
    % Create child2 by combining a random crossover point from parent2 to parent1
    child2 = [parent2(1:crossover_row,1:crossover_col,:) parent1(1:crossover_row,crossover_col+1:m,:) ; parent1(crossover_row+1:n,1:crossover_col,:) parent2(crossover_row+1:n,crossover_col+1:m,:)];
end