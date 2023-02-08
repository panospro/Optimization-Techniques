% lb: lower bound for decision variables
% ub: upper bound for decision variables
function new_member = create_new_member(lb, ub, population_size)
    new_member = lb + (ub-lb).*rand(size(lb,1), size(lb,2), population_size);
end