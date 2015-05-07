function [cornerX,cornerY] = findObstacle(mask,birdX)
% FIND last point 
WIDTH = size(mask,2);
PIPE_WIDTH = 85;
CORNER_CORRECTION = -50; %-10;

% Take the part we are going to analyze
maskToUse = mask(:,birdX:end)./250>0;

% Obtain last row and find first white
row = maskToUse(end,:);
cornerX = find(row,1,'last');

% If it is not found
if isempty(cornerX)
    %cornerX = -1;
    %cornerY = -1;
    cornerX = birdX+1;%WIDTH + PIPE_WIDTH + CORNER_CORRECTION;
    cornerY = 1;
    return
    
end

% Calculate corner y
col = maskToUse(:,cornerX);
cornerY = find(col==0,1,'last');

% Check if we are not in the middle of a pipe (because it is in the start)
if row(end)>0
   %  fprintf('d= %d',cornerX+birdX);
    % Take the first point
    % Calculate the start and add the width
    cornerX = find(row(1:end-10)==0,1,'last')+PIPE_WIDTH-10; % correction TODO
 %   fprintf(' - CORRECTING: final= %d',cornerX+birdX);
end
cornerX = cornerX+CORNER_CORRECTION;
% fprintf('- d= %d\n',cornerX+birdX);

% Correct corner
cornerX = cornerX+birdX;
end