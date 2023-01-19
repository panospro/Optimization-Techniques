clear;
close all;
clc;

population_size = 10;
t = [1 2 3 4 5];
a = [1; 1; 1; 1.25 ; 1.5];
incoming_rate = 100;
parent1 = [1; 2; 3; 4; 5; 6];
parent2 =[2; 3; 4; 5; 6; 7];
child = [1; 2; 3; 4; 5];
mutation_rate = 0.8;
x = [0.1; 0.2; 0.5; 0.3; 0.4];
c = [5 5 5 5 5];



[x0, Aeq, beq, lb, ub] = initialization(t, a, c, incoming_rate);
[child1, child2] = crossover(parent1, parent2);
mutant = mutate(child, lb, ub, mutation_rate);
fit = fitness(x, t, a, c, incoming_rate); % ??
population = create_new_member(lb, ub, population_size);








































% % for i = 1:2
% %     fit(i,:) = fitness(population(i,:), t, a, c, incoming_rate);
% % end
% % fit
% 
% t = [1 2 3 4 5]; % Fixed time required to move on each road
% a = [0.1; 0.2; 0.3; 0.4; 0.5]; % Rate of passage of vehicles on each road
% c = [10 20 30 40 50];
% 
% population = [1.5631    3.1262    4.6893    6.2523    7.8154;
%               1.5631    3.1262    4.6893    6.2523    7.8154];
% 
% population(1,:);
% population(2,:);
% 
% fit = zeros(2, 5);
% fit(1,:) = fitness(population(1,:), t, a, c, incoming_rate)
% fit(2,:) = fitness(population(2,:), t, a, c, incoming_rate)
% % fitness(1,:) = fitness(population(1,:), t, a, c, incoming_rate)
% % for i = 1: population_size
% %     fitness(i,:) = fitness(population(i,:), t, a, c, incoming_rate)
% % end
% fit