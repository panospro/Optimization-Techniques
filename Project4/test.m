%% In 2D
% in x are the roads
% in y the population of the trajectory

%% In 3D
% in x from node 1 to 2
% in y from node 2 to 1
% in z the population
clear;
close all;
clc;

population_size = 10;
incoming_rate = 100;
parent1 = [1; 2; 3; 4; 5; 6];
parent2 =[2; 3; 4; 5; 6; 7];
child = [1; 2; 3; 4; 5];
mutation_rate = 0.9;

t = [ 0  0    0   0   0   0   0   0  0; 
     10  0    0   0   0   0   0   0  0; 
     10  0    0   0   0   0   0   0  0; 
     10  0    0   0   0   0   0   0  0; 
     10  10  10   0   0   0   0   0  0; 
      0  10   0   0  10   0   0   0  0; 
      0  0   10  10  10   0   0   0  0; 
      0  0    0  10   0   0  10   0  0; 
      0  0    0   0  10  10  10  10  0];

a = [0     0    0    0     0  0  0  0  0; 
     1.25  0    0    0     0  0  0  0  0; 
     1.25  0    0    0     0  0  0  0  0; 
     1.25  0    0    0     0  0  0  0  0; 
     1.25  1.5  1.5  0     0  0  0  0  0; 
     0     1.5  0    0     1  0  0  0  0; 
     0     0    1.5  1.5   1  0  0  0  0; 
     0     0    0    1.25  0  0  1  0  0; 
     0     0    0    0     1  1  1  1  0];

c = [0      0     0      0      0      0      0      0      0; 
     49.19  0     0      0      0      0      0      0      0; 
     21.56  0     0      0      0      0      0      0      0; 
     54.13  0     0      0      0      0      0      0      0; 
     34.08 47.24  24.87  0      0      0      0      0      0; 
     0     33.97  0      0      26.89  0      0      0      0; 
     0      0     29.96  21.84  39.98  0      0      0      0; 
     0      0     0      33.03  0      0      37.12  0      0; 
     0      0     0      0      32.76  59.73  53.83  61.65  0];


[x0, Aeq, beq, lb, ub] = initialization(t, a, c); 
population = create_new_member(lb, ub, population_size);
[child1, child2] = crossover(population(:,:,1), population(:,:,2));
mutant = mutate(child1, lb, ub, mutation_rate);
fit = fitness(population, t, a, c, incoming_rate) 