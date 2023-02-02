clc;
clear;

N = 100; % number of cells in each dim
T = 12000; % number of new grains
state = randi(3, N, N); % start with random init conditions between 0 and 3
max_count = 0;

avalanche_size = zeros(1, T);

% video = VideoWriter('animation.avi', 'Motion JPEG AVI');
% video.Quality = 100;
% video.FrameRate = 30;
% open(video);

all_avalanches = zeros(N, N);
for t=1:T
    x = randi(N);
    y = randi(N);

    [state, avalanche, count] = topple(state, x, y, N);
    
    avalanche_size(t) = nnz(avalanche);    
    
    % this only shows when there is a bigger avalanche happens
    if count > 0%max_count
        max_count = count;
        imagesc(avalanche);

%         imagesc(state);
        title(strcat('Iteration:  ', num2str(t)))
        axis equal off;
        
        drawnow
        
    end
%     if mod(t, 10)== 0 && t>1000 
%          % Write the current frame to the video
%         frame = getframe(gcf);
%         writeVideo(video, frame);
%     end
   
end
hold off;
% % Close the video writer object
% close(video);

size_count = histcounts(avalanche_size, 1:N^2);
size_count = size_count(size_count ~= 0);

axis equal

plot(log(1:length(size_count)), log(size_count))
title('Powe Law for Sandpile Model')
xlabel('Avalance Size (log)')
ylabel('Frequency (log)')

