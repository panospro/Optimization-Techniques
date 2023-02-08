function plot_results(best_fitness_history)
    figure;
    plot(1:length(best_fitness_history), best_fitness_history);
    xlabel('Generation');
    ylabel('Best Fitness');
    title('Evolution of Best Fitness');
end