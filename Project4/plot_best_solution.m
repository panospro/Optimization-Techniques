% Generates a histogram plot of the best solutions distribution for a given node i.
% On the x axis we have time 
% On the y axis we have frequency
function plot_best_solution(best_fitness,i)
    figure;
    histogram(best_fitness(:,i,:));
    xlabel('Time');
    ylabel('Frequency');
    title(sprintf('Best Solutions Distribution for node %d', i));
end