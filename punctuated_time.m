clc;
clear;
%Punctuated equilibrium and criticality in a simple model of evolution

N = 100; % number of species
T = 100000; % number of evolutionary epochsl
f = rand(N,1); % initial fitness
r = rand(3,T); % 3 random numbers for each epoch
s(T+1, 3) = 0;

for t=1:T
    [~, mf] = min(f); % find the weakest
    f(mod(mf-2:mf,N)+1, 1) = r(:,t); % replace  weakest and its neighbors
    s(t, :) = mod(mf-2:mf, N)+1;
end 

xlabel('Time')
plot(s, 'r.')