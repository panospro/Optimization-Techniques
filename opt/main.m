clear;
close all;
clc;

%% Define problem parameters
% Fixed time required to move on each road
t = [ 0  0    0   0   0   0   0   0  0; 
     10  0    0   0   0   0   0   0  0; 
     10  0    0   0   0   0   0   0  0; 
     10  0    0   0   0   0   0   0  0; 
     10  10  10   0   0   0   0   0  0; 
      0  10   0   0  10   0   0   0  0; 
      0  0   10  10  10   0   0   0  0; 
      0  0    0  10   0   0  10   0  0; 
      0  0    0   0  10  10  10  10  0];


% Rate of passage of vehicles on each road
a = [0     0    0    0     0  0  0  0  0; 
     1.25  0    0    0     0  0  0  0  0; 
     1.25  0    0    0     0  0  0  0  0; 
     1.25  0    0    0     0  0  0  0  0; 
     1.25  1.5  1.5  0     0  0  0  0  0; 
     0     1.5  0    0     1  0  0  0  0; 
     0     0    1.5  1.5   1  0  0  0  0; 
     0     0    0    1.25  0  0  1  0  0; 
     0     0    0    0     1  1  1  1  0];

% t = [10 10 10 10 10 10 10 10 10];
% a = [1; 1; 1; 1; 1; 1; 1; 1; 1];
% Maximum rate of passage of vehicles on each road
c = [0      0     0      0      0      0      0      0      0; 
     49.19  0     0      0      0      0      0      0      0; 
     21.56  0     0      0      0      0      0      0      0; 
     54.13  0     0      0      0      0      0      0      0; 
     34.08 47.24  24.87  0      0      0      0      0      0; 
     0     33.97  0      0      26.89  0      0      0      0; 
     0      0     29.96  21.84  39.98  0      0      0      0; 
     0      0     0      33.03  0      0      37.12  0      0; 
     0      0     0      0      32.76  59.73  53.83  61.65  0];
 
incoming_rate = 100; % Incoming rate of vehicles

% Define algorithm parameters
population_size = 100;
mutation_rate = 0.9;
crossover_rate = 0.8;
max_generations = 100;

% Run the genetic algorithm
[best_fitness, indexOfMinimumFitness] = genetic_algorithm(t, a, c, incoming_rate, population_size, mutation_rate, crossover_rate, max_generations);

% Print the best solution
% fprintf('Best fitness: %f, Best solution: %s\n', best_fitness, mat2str(best_solution));
% for i = 1:max_generations
%     fprintf('Best fitness for generation %d : %f\n', i, best_fitness(i));
% end

% Plot the results
for i = 1:length(c)
    plot_results(best_fitness(:,:,i));
end


% for i = 1:length(c)
%     plot_best_solution(best_fitness(:,:,i));
% end
% plot_best_solution(best_fitness);
%     fit(:,:,index(:,:,1))
%     index(:,:,1)
%     best_solution(:,:,1)
    % Get only the minimum values from each row (roads)
% plot_best_solution(best_solution_history(:,1));

% στον x αξονα ειναι οι δρομοι
% στον y το population του καθε δρομου

%% Στον 3D
% στον x το απο τον κομβο 1 στον 2
% στον y το απο τον κομβο 2 στον 1
% στον z το population