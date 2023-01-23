% child: decision variables of the child to be mutated
% lb: lower bound for decision variables
% ub: upper bound for decision variables
% mutation_rate: probability of mutation for each decision variable
function mutant = mutate(child, lb, ub, mutation_rate)
    % Take the size of child and initialize the output to input
    n = size(child,1);
    mutant = child;
   
    for i = 1:n
        if rand() < mutation_rate
            % Change the output by a value in the bounds if the mutation_rate is
            % bigger than a random number
            mutant(i,:,:) = mutant(i,:,:) + (ub(i,:)-lb(i,:)).*(2*rand() - 1) + lb(i,:);
            
            % Ensure that the mutated decision variable is within the bounds
            mutant(i,:,:) = max(min(mutant(i,:,:), ub(i,:)), lb(i,:));
        end
    end
end