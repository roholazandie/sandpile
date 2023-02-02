clc;
clear;
%Punctuated equilibrium and criticality in a simple model of evolution

N = 100; % number of species
T = 1000000; % number of evolutionary epochsl
f = rand(N,1); % initial fitness
r = rand(3,T); % 3 random numbers for each epoch

for t=1:T
    [~, mf] = min(f); % find the weakest
    f(mod(mf-2:mf,N)+1, 1) = r(:,t); % replace  weakest and its neighbors
    plot(f);
    ylim([0 1]);
    drawnow;
end