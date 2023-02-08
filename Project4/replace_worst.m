% current_population: current population of solutions
% lb: lower bound for decision variables
% ub: upper bound for decision variables
% t: vector of fixed time required to move on each road
% a: vector of rate of passage of vehicles on each road
% c: vector of maximum rate of passage of vehicles on each road
% incoming_rate: constant representing the incoming rate of vehicles
function new_population = replace_worst(current_population, lb, ub, t, a, c, incoming_rate)
    n = size(current_population, 3);
    fit = zeros(n, length(a));
    for i = 1:n
        fit(i,:) = fitness(current_population(:,:,i), t, a, c, incoming_rate);
    end
    [~, index] = sort(fit);
    worst_index = index(1:round(n/4));
    current_population(:,:,worst_index) = create_new_member(lb, ub, length(worst_index));
    new_population = current_population;
end