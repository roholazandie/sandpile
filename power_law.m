%in order to run this script you need to have avalanche_size from sandpile
% or copy the following code to the end of that code

% N = 200;
% 
% size_count = zeros(1,N^2);
% 
% for i=1:length(avalanche_size)
%     if avalanche_size(i) ~=0
%         size_count(avalanche_size(i))= size_count(avalanche_size(i)) + 1;
%     end
% end
% 
% axis equal
% plot(log(1:length(size_count)),log(size_count))

size_count = histcounts(avalanche_size, 1:N^2);
size_count = size_count(size_count ~= 0);

axis equal
plot(log(1:length(size_count)), log(size_count))

title('Powe Law for Sandpile Model')
xlabel('Avalance Size (log)')
ylabel('Frequency (log)')
