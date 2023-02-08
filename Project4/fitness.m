% x: vector of decision variables (number of vehicles on each road)
% t: vector of fixed time required to move on each road
% a: vector of rate of passage of vehicles on each road
% c: vector of maximum rate of passage of vehicles on each road
function fit = fitness(x, t, a, c, incoming_rate)
    [~,~,k] = size(x);
    for i = 1:k
        sum_x = sum(sum(x(:,:,i)));
        sum_c = sum(sum(c));
        if(sum_x > 0 && sum_c > 0)
            fit(i) = sum(sum(t.*x(:,:,i))) + sum(sum(a.*x(:,:,i)))/(1 - sum(sum(x(:,:,i)))/sum_c)/incoming_rate + sum(sum(x(:,:,i) > c)) + sum(sum(x(:,:,i) < 0));
        else
            fit(i) = Inf; % give a large value
        end
    end
end