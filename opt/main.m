clear;
close all;
clc;

% Define problem parameters
t = [1 2 3 4 5]; % Fixed time required to move on each road
a = [0.1; 0.2; 0.3; 0.4; 0.5]; % Rate of passage of vehicles on each road
c = [10 20 30 40 50]; % Maximum rate of passage of vehicles on each road
incoming_rate = 100; % Incoming rate of vehicles

% Define algorithm parameters
population_size = 100;
mutation_rate = 0.01;
crossover_rate = 0.8;
max_generations = 100;

% Run the genetic algorithm
[best_solution, best_fitness] = genetic_algorithm(t, a, c, incoming_rate, population_size, mutation_rate, crossover_rate, max_generations);

% Print the best solution
fprintf('Best fitness: %f, Best solution: %s\n', best_fitness, mat2str(best_solution));

