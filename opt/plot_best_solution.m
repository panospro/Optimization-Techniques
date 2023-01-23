% function plot_best_solution(best_solution)
%     figure;
%     hist(best_solution);
%     xlabel('best solutions');
%     ylabel('Frequency');
%     title('Best Solutions Distribution');
% end

function plot_best_solution(best_fitness)
    figure;
    semilogy(1:size(best_fitness,2), best_fitness);
    xlabel('Generation');
    ylabel('Best Fitness');
    title('Convergence of Best Fitness');
end
