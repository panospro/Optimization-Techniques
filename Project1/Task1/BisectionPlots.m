% In this script there are the plots for the Bisection Method.
% There are 5 figures created:
% one that shows the change on calculations of each function,with epsilon
% value changing and lamda value constant
% one that shows the change on calculations of each function,with lamda
% value changing and epsilon value constant
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
F = {f1,f2,f3};   

%% �he change on calculations of each function,with epsilon value changing and lamda fixed
FigH = figure('Name','Change in calculations of f_i for changing epsilon and fixed lamda values','NumberTitle', 'off');
FigH.Position = [500 200 900 700];
sgtitle('The difference in calculations of f with changing epsilon and lamda = 0.01')
l = 0.01;
iter = zeros(50,1);
epsilon = zeros(50,1);

for i = 1:3
    % Initializing of the number of iteration
    k = 1;
    % Having 60 different values of epsilon
    for e = linspace(0.001,0.0049,50)
        [~,~,iter(k),epsilon(k),~] = bisectionMethod(F{i},e,l,a,b);
        k = k + 1;
    end
    subplot(3,1,i)
    % Plotting epsilon in relation to iter,we could do the opposite and have 
    % the same result but with a different point of view
    plot(epsilon,iter)
    title(sprintf('f_%d(x) ',i))
    xlabel('value of epsilon')
    ylabel('# of iterations')
end

%% �he change on calculations of each function,with lamda value changing and epsilon fixed
FigH = figure('Name','Change in calculations of f_i for changing lamda and fixed epsilon values','NumberTitle', 'off');
FigH.Position = [500 200 900 700];
sgtitle('The difference in calculations of f with changing lamda and epsilon = 0.001')
e = 0.001;
iter = zeros(50,1);
lamda = zeros(50,1);

for i = 1:3
    % Initializing of the number of iteration
    k = 1;
    % Having 50 different values of lamda
    for l = linspace(0.0021,0.1,50)         
        [~,~,iter(k),~,lamda(k)] = bisectionMethod(F{i},e,l,a,b);  
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

%% The change of the interval for different lamda values and fixed epsilon
% Different values of lamda (you can add other values as well in the array)
l = [0.02 0.04 0.06 0.09];
e = 0.001;
% Every function in a separate graph
for k = 1:3
    FigH = figure('Name','The end points of the function');
    FigH.Position = [500 200 900 700];
    set(FigH, 'NumberTitle', 'off','Name',sprintf('Figure for f%d', k));
    % Every lamda value in the same graph
    for i = 1:length(l)
        subplot(length(l),1,i)
        sgtitle(sprintf('The end points of f_%d(x)',k))
        [a_i,b_i,iter,~] = bisectionMethod(F{k},e,l(i),a,b);
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