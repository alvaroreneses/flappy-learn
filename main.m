function [  ] = main( )
    % Add folders to the path
    addpath('util');

    % Algorithm variables
    ERROR = 10;
    STEP_SIZE = 30;
    WIN_CONSTANT = 900;
    DELAY = 0.1; 
    LEARNING_DISPERSION = 0.2;
    LIMIT_GAMES = -1;

    % Start analyzing
    MAX_ATTEMPS =  10;
    currentAttemp = 0;
    while currentAttemp < MAX_ATTEMPS
        currentAttemp = currentAttemp+1;
        try
            startAnalysis(ERROR,STEP_SIZE,WIN_CONSTANT,DELAY,LEARNING_DISPERSION,LIMIT_GAMES);
            break;
        catch err
            fprintf('The recognition was not possible\n');
            rethrow(err)
        end
    end
end

