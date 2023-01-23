% current_generation: current population of solutions
% lb: lower bound for decision variables
% ub: upper bound for decision variables
% mutation_rate: probability of mutation for each decision variable
% crossover_rate: probability of crossover for each pair of solutions
% fitness: function to evaluate the fitness of each solution
function next_generation = create_next_generation(current_generation, lb, ub, mutation_rate, crossover_rate, t, a, c, incoming_rate)
    % Initialize the length of the population and if its an even number
    % shorten the length of population by one
    n = size(current_generation, 1);
    if mod(size(current_generation,3),2) ~= 0
        current_generation = current_generation(:,:,1:end-1);
    end
    
    % Initialize the next generation to the current one
    next_generation = current_generation;
    
    k = 0;
    % Go through the population and crossover, mutate and fitness it
    for i = 1:2:n-1
        if rand() < crossover_rate
            % Crossover the ith and (i+1)th solutions
            [child1, child2] = crossover(current_generation(i,:,:), current_generation(i+1,:,:));
            k = k + 1;
        end
    end
    
    % Do at least one crossover
    if k == 0
        [child1, child2] = crossover(current_generation(i,:,:), current_generation(i+1,:,:));
    end
    
    % Mutate the children if mutation rate bigger than rand
    child1 = mutate(child1, lb, ub, mutation_rate); %?
    child2 = mutate(child2, lb, ub, mutation_rate);%?
            
    % Evaluate the fitness of the children
    fitness_child1 = fitness(child1, t, a, c, incoming_rate);
    fitness_child2 = fitness(child2, t, a, c, incoming_rate);
            
    for i = 1:n-1
        % Replace the parents with the best child if its fitness is better
        if fitness_child1 < fitness(current_generation(i,:,:), t, a, c, incoming_rate)
            next_generation(i,:,:) = child1;
        end
        if fitness_child2 < fitness(current_generation(i+1,:,:), t, a, c, incoming_rate)
            next_generation(i+1,:,:) = child2;
        end
    end
    
    % Replace some of the worst solutions with new randomly generated solutions
    next_generation = replace_worst(next_generation, lb, ub, t, a, c, incoming_rate);
end