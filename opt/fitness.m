% x: vector of decision variables (number of vehicles on each road)
% t: vector of fixed time required to move on each road
% a: vector of rate of passage of vehicles on each road
% c: vector of maximum rate of passage of vehicles on each road
function fit = fitness(x, t, a, c, incoming_rate)
    % Calculate traffic time on each road
%     T = t + a.*x./(1 - (x./c));
%     
%     % Calculate average traversal time per vehicle
%     fit = sum(T) / sum(x);
    
    fit = sum(t + a.*x./(1 - (x./c)))/incoming_rate + sum(x > c) + sum(x < 0);
end

