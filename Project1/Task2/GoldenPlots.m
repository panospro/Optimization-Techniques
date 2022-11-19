% In this script there are the plots for the Golden section Method.
% There are 4 figures created:
% one that shows the change on calculations of each function,with lamda
% value changing
% and three that show the change of the interval for 4 different lamda
% values
clc;
clear;
close all;

%% The functions and the interval
syms x;
f1 =@(x) (x-2)^2 + x*log(x+3);
f2 =@(x) 5^x + (2-cos(x))^2;
f3 =@(x) exp(x)*(x^3-1)+(x-1)*sin(x);
a = -1;
b = 3;
F{1} = f1;
F{2} = f2; 
F{3} = f3;

%% Ôhe change on calculations of each function,with lamda value changing
FigH = figure('Name','Change in calculations of f_i for different lamda values','NumberTitle', 'off');
FigH.Position = [500 200 900 700];
sgtitle('The difference in calculations of f with different lamda')
for i = 1:3
    % Initializing of the number of iteration
    k = 1;
    % Having 60 different values of lamda
    for l = linspace(0.001,0.1,60)
        [~,~,iter(k),lamda(k)] = goldMethod(F{i},l,a,b);
        k = k + 1;
    end
    subplot(3,1,i)
    % Plotting lamda in relation to iter,we could do the opposite and have 
    % the same result but with a different point of view
    plot(lamda,iter)
    title(sprintf('f_%d(x) ',i))
    xlabel('value of lamda')
    ylabel('# of iterations')
end

%% The change of the interval for different lamda values
% Different values of lamda (you can add other values as well in the array)
l = [0.02 0.04 0.06 0.09];
% Every function in a separate graph
for k = 1:3
    FigH = figure('Name','The end points of the function');
    FigH.Position = [500 200 900 700];
    set(FigH, 'NumberTitle', 'off','Name',sprintf('Figure for f%d', k));
    % Every lamda value in the same graph
    for i = 1:length(l)
        subplot(length(l),1,i)
        sgtitle(sprintf('The end points of f_%d(x)',k))
        [a_i,b_i,iter,~] = goldMethod(F{k},l(i),a,b);
        % The black signs represents 'a' and red signs 'b'
        for j=0:iter-2
            title(['The value of lamda is ',num2str(l(i))])
            plot(j,a_i(j+1),"oblack")
            hold on;
            grid on;
            plot(j,b_i(j+1),"pentagramr")
            xlabel('# of iterations')
            ylabel('Interval [a b]')
        end
    end
end