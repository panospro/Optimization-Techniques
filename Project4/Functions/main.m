%% In 3D
% in x from node 1 to 2
% in y from node 2 to 1
% in z the population
clear;
close all;
clc;

%% Define problem parameters
% Fixed time required to move on each road
t = [ 0  0  0  0  0  0  0  0  0; 
      1  0  0  0  0  0  0  0  0; 
      1  0  0  0  0  0  0  0  0; 
      1  0  0  0  0  0  0  0  0; 
      1  1  1  0  0  0  0  0  0; 
      0  1  0  0  1  0  0  0  0; 
      0  0  1  1  1  0  0  0  0; 
      0  0  0  1  0  0  1  0  0; 
      0  0  0  0  1  1  1  1  0];

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

%% Task 3
% Calculate the maximum and minimum values of the rate, taking into account the variation
variation = 0.15; % variation by 15%
max_rate = incoming_rate + incoming_rate * variation;
min_rate = incoming_rate - incoming_rate * variation;
incoming_rate = min_rate + (max_rate - min_rate) * rand();

%% Task 2
% Define algorithm parameters
population_size = 100;
mutation_rate = 0.1;
crossover_rate = 0.8;
max_generations = 10000;

% Run the genetic algorithm 
[best_fitness, indexOfMinimumFitness] = genetic_algorithm(t, a, c, incoming_rate, population_size, mutation_rate, crossover_rate, max_generations);

% Print the minimum time of the network
minimumTime = [];
for i = 1:length(c)-1   
    minimumTime(i) = mean(best_fitness(:,i,:));
    fprintf('The minimum time of node %d of the network\naccording to the genetic algorithm is: %f\n\n', i, minimumTime(i));
end

fprintf('The minimum time for the network\naccording to the genetic algorithm is: %f\n', sum(minimumTime));

for i = 1:length(c)
    plot_best_solution(best_fitness,i);
%     file_name = ['plot2_' num2str(i) '.png'];
%     saveas(gcf, file_name, 'png');
end