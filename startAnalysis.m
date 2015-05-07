function [  ] = startAnalysis( ERROR,STEP_SIZE,WIN_CONSTANT,DELAY,LEARNING_DISPERSION,LIMIT_GAMES )

% Initialize the information
[limits, bird, base] = initializeGame();

% Move the mouse to the game and select it 
middleBoard = [round(mean([limits(1) limits(3)])), round(mean([limits(2) limits(4)]))];
mouseMove(middleBoard(1),middleBoard(2));
%mouseLeftClick();

% Wait for Matlab
pause on    
pause(0.5); 

%birdX = bird(1)+10; % margen de caida
birdX = 215; % TODO
originalBirdY = bird(2);
[originalCornerX,originalCornerY] = findObstacle(base,birdX);
 
 % LEARN LOOSE SCREEN
 mouseLeftClick(); % Select window
 mouseLeftClick(); % Click
 pause(2); % Waint until crash
 state = screenshot(limits(1),limits(2),limits(3),limits(4));
 WIDTH = size(state,2)-birdX;
 HEIGHT = size(state,1);
 gameOverMask = calculateMask(base,state);
 keyboardSpace(); % Restart game
 pause(0.5);
 
% BRAIN

%games = 500; brain = dlmread('brain500.txt');
games = 0; brain = zeros(HEIGHT*2,round(WIDTH*1.5)); 

% Start
mouseLeftClick();

while (1)
    % Increment the number of played games
    games = games + 1;
    fprintf('Games: %d\n',games);
    % Reset values
    birdY = originalBirdY;
    cornerX = originalCornerX;
    cornerY = originalCornerY;
    % Iterations
    i = 0;
    % Decision map
    decisions = zeros(0,3);
    
    while (1)
        
        % Increment iterations
        i = i+1;

        % Obtain mask
         state = screenshot(limits(1),limits(2),limits(3),limits(4));
         mask = calculateMask(base,state);
         %imwrite(mask,strcat('Mask', num2str(i),'.jpg'));

         % Check if we have lost
         if checkIfGameOver(gameOverMask,mask)  &&  i>1 
            brain = learnGame(LEARNING_DISPERSION,brain,decisions,'loss',WIN_CONSTANT);
            %pause
            fprintf('GAME OVER\n\n');
            break;
         end

         % Check if a obstacle appear
         oldCornerX = cornerX;
         oldCornerY = cornerY;
         [cornerX,cornerY] = findObstacle(mask,birdX);

         % Check if we have pass a pipe (or we have arrived to the first one)
         % In this case learn the game and continue
         if  i>1 && (oldCornerX < cornerX)
             brain = learnGame(LEARNING_DISPERSION,brain,decisions,'win',WIN_CONSTANT);
             fprintf('GAME WON\n\n');
         end

         % Check the position of the bird
         birdY = findBird(mask,birdX);

         % If we are over the screen, wait for allow it to go down
         if birdY == 1
             fprintf('Over screen');
            pause(1);
         end

         % Decide action according to bird and corner and store it
         decisions(end+1,:) = makeADecision(brain,birdX,birdY,cornerX,cornerY, HEIGHT, WIDTH, ERROR, STEP_SIZE);

         % Continue 
         pause(DELAY);
    end

    % Save the brain each 20 games
    if rem(games,20)==0
        dlmwrite(strcat('brain', num2str(games),'.txt'), brain);
    end

    % If we have set a limit of games, stop
     if LIMIT_GAMES > 0  &&  games== LIMIT_GAMES
         break
     end

    % Press restard
    pause(0.5)
    keyboardSpace();
end

end

