% lb: lower bound for decision variables
% ub: upper bound for decision variables
function new_member = create_new_member(lb, ub, population_size)
    n = size(lb,1);
    new_member = lb + (ub - lb) .* rand(population_size,n);
end
