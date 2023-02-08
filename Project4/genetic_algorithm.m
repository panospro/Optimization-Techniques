% t: vector of fixed time required to move on each road
% a: vector of rate of passage of vehicles on each road
% c: vector of maximum rate of passage of vehicles on each road
% incoming_rate: constant representing the incoming rate of vehicles
% population_size: the size of the population
% mutation_rate: the rate of the mutation
% crossover_rate: the rate of crossover
% max_generations: the number of max generations
function [best_fitness, indexOfMinimumFitness] = genetic_algorithm(t, a, c, incoming_rate, population_size, mutation_rate, crossover_rate, max_generations)
    % Initialize the optimization problem
    [x0, Aeq, beq, lb, ub] = initialization(t, a, c);
    numberOfRoads = length(a);
    
    % Create the initial population of solutions
    populationStart = create_new_member(lb, ub, population_size);

    % Initialize the fit variable
    fit = zeros(population_size, numberOfRoads, max_generations);

    % Main loop
    for generation = 1:max_generations
        % Create the next generation
        population = create_next_generation(populationStart, lb, ub, mutation_rate, crossover_rate, t, a, c, incoming_rate);
        
        % Evaluate the fitness of the generation
        for i = 1:population_size
            for j = 1:numberOfRoads
                fit(i,j, generation) = fitness(population(:,j,i), t, a, c, incoming_rate);
            end
        end
    end
    % Return the best fitness and solution of every generation
    [best_fitness, indexOfMinimumFitness] = min(fit);
%     best_fitness = fit;
end