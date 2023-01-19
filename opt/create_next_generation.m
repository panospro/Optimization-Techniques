% current_generation: current population of solutions
% lb: lower bound for decision variables
% ub: upper bound for decision variables
% mutation_rate: probability of mutation for each decision variable
% crossover_rate: probability of crossover for each pair of solutions
% fitness: function to evaluate the fitness of each solution
function next_generation = create_next_generation(current_generation, lb, ub, mutation_rate, crossover_rate, fitness)
    n = size(current_generation, 1);
    next_generation = current_generation;
    for i = 1:2:n
        if rand() < crossover_rate
            % Crossover the ith and (i+1)th solutions
            [child1, child2] = crossover(current_generation(i,:), current_generation(i+1,:));
            % Mutate the children
            child1 = mutate(child1, lb, ub, mutation_rate);
            child2 = mutate(child2, lb, ub, mutation_rate);
            % Evaluate the fitness of the children
            fitness_child1 = fitness(child1);
            fitness_child2 = fitness(child2);
            % Replace the parents with the best child if its fitness is better
            if fitness_child1 < fitness(current_generation(i,:))
                next_generation(i,:) = child1;
            end
            if fitness_child2 < fitness(current_generation(i+1,:))
                next_generation(i+1,:) = child2;
            end
        end
    end
    
    % Replace some of the worst solutions with new randomly generated solutions
    next_generation = replace_worst(next_generation, lb, ub, fitness);
end

