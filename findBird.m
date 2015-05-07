function [birdY] = findBird(mask,birdX)
% Find the new birdY 
% (birdY = bottom bird)

    % Load properties from the parameters
    HEIGHT = size(mask,1);
    
    % Column of the bird
    col = mask(:,birdX);
    
    % Calculate birdY
    birdY = find(col,1,'last');
    
    % If it not found -> Over the screen -> set to the border
    if isempty(birdY)
    	birdY = 1;
    end
    
    % If the position is HEIGHT, then it is pipe, so check manually
    if birdY == HEIGHT
        newLimit = find(col==0,1,'last');
        birdY = find(col(1:newLimit-5),1,'last'); % Margin of 5
        if isempty(birdY)
            birdY = 1;
        end
    end
    
end

