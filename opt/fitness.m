% x: vector of decision variables (number of vehicles on each road)
% t: vector of fixed time required to move on each road
% a: vector of rate of passage of vehicles on each road
% c: vector of maximum rate of passage of vehicles on each road
% function fit = fitness(x, t, a, c, incoming_rate)
%     % Calculate traffic time on each road
% %     T = t + a.*x./(1 - (x./c));
% %     
% %     % Calculate average traversal time per vehicle
% %     fit = sum(T) / sum(x);
%     size(x)
%     size(t)
%     size(a)
%     size(c)
%     [~,~,k] = size(x);
%     for i = 1:k
% %         fit(:,:,i) = sum(t + a.*x(:,:,i)./(1 - (x(:,:,i)./c)))/incoming_rate + sum(x(:,:,i) > c) + sum(x(:,:,i) < 0);
% %         fit(i) = sum(sum(t.*x(:,:,i)) + sum(sum(a.*x(:,:,i))/(1 - sum(sum(x(:,:,i)./c)))/incoming_rate + sum(sum(x(:,:,i) > c)) + sum(sum(x(:,:,i) < 0))));
%     
%     end
%     
% end

function fit = fitness(x, t, a, c, incoming_rate)
    [~,~,k] = size(x);
    for i = 1:k
        sum_x = sum(sum(x(:,:,i)));
        sum_c = sum(sum(c));
        if(sum_x > 0 && sum_c > 0)
            fit(i) = sum(sum(t.*x(:,:,i))) + sum(sum(a.*x(:,:,i)))/(1 - sum(sum(x(:,:,i)))/sum_c)/incoming_rate + sum(sum(x(:,:,i) > c)) + sum(sum(x(:,:,i) < 0));
        else
            fit(i) = Inf; % or any other value that can be considered as a large value
        end
    end
end
