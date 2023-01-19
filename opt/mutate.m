% child: decision variables of the child to be mutated
% lb: lower bound for decision variables
% ub: upper bound for decision variables
% mutation_rate: probability of mutation for each decision variable
function mutant = mutate(child, lb, ub, mutation_rate)
    n = size(child,1);
    mutant = child;
    for i = 1:n
        if rand() < mutation_rate
            % Mutate the decision variable by adding a random value between -1 and 1
            mutant(i) = mutant(i) + (2*rand() - 1);
            % Ensure that the mutated decision variable is within the lower and upper bounds
            mutant(i) = max(min(mutant(i), ub(i)), lb(i));
        end
    end
end