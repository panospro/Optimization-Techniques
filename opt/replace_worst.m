function new_population = replace_worst(current_population, lb, ub, fitness_function)
    n = size(current_population, 1);
    fitness = zeros(n, 1);
    for i = 1:n
        fitness(i) = fitness_function(current_population(i,:));
    end
    [~, index] = sort(fitness);
    worst_index = index(1:round(n/4));
    current_population(worst_index,:) = create_new_member(lb, ub);
    new_population = current_population;
end