function [decision] = makeADecision(brain,birdX,birdY,cornerX,cornerY, HEIGHT, WIDTH, ERROR, STEP_SIZE)
    
    % Create the original decision
    %PIPE_WIDTH = 80;
    %if cornerX==-1 || cornerY==-1
      %  h = birdY;
     %   d = WIDTH+PIPE_WIDTH;%+ARREGLO_ANCHO;
   % else
        h = cornerY-birdY+HEIGHT;
        d = cornerX-birdX;
    %end
    
    if h <= 0
        h
        pause
    end
    
%     if d>324
%         cornerX
%         birdX
%         d
%         pause
%     end
    
    decision = [h,d,0];
    
    % Obtain direct action from brain
    minRow = max(1,h-ERROR);
    maxRow = min(HEIGHT*2,h+ERROR);
    minCol = max(1,d-ERROR);
    maxCol = min(WIDTH,d+ERROR);
    b = brain(minRow:maxRow,minCol:maxCol);
    v = sum(b(:));
    
    % If it is not concluding, take the step
    if v == 0
        minRow = max(1,h-STEP_SIZE);
        maxRow = min(HEIGHT*2,h+STEP_SIZE);
        minCol = max(1,d-STEP_SIZE);
        maxCol = min(WIDTH,d+STEP_SIZE);
        b = brain(minRow:maxRow,minCol:maxCol);
        v = sum(b(:)); 
    end
    
    % Take the decission
    if v>0 || round(rand)
        decision(3) = 1;
        mouseLeftClick();% mouseLeftClick();
        if v>0
            fprintf('Memory JUMP\n');
        else
            fprintf('Random JUMP\n');
        end
    else
        decision(3) = -1;
        if v<0
            fprintf('Memory WAIT\n');
        else
            fprintf('Random WAIT\n');
        end
    end
    
end

