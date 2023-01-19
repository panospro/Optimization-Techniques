function [best_solution, best_fitness] = genetic_algorithm(t, a, c, incoming_rate, population_size, mutation_rate, crossover_rate, max_generations)
    % Initialize the optimization problem
    [x0, Aeq, beq, lb, ub] = initialization(t, a, c, incoming_rate);
    
    % Create the initial population of solutions
    population = create_new_member(lb, ub, population_size);

    % Evaluate the fitness of the initial population
    fit = zeros(population_size, length(a));

    for i = 1: population_size
        fit(i,:) = fitness(population(i,:), t, a, c, incoming_rate);
    end

    % Main loop
    for generation = 1:max_generations
        % Create the next generation
        population = create_next_generation(population, lb, ub, mutation_rate, crossover_rate, fit);
        
        % Evaluate the fitness of the next generation
        fit = zeros(population_size, 1);
        for i = 1:population_size
            fit(i) = fitness(population(i,:), t, a, c, incoming_rate);
        end
    end
    
    % Return the best solution of the final generation
    [best_fitness, index] = min(fit);
    best_solution = population(index, :);
end
