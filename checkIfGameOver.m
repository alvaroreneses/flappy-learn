function [ isGameOver ] = checkIfGameOver(gameOverMask,mask)
    TOLERANCE = 1000;
    and = mask.*gameOverMask;
    diff = abs(sum(and(:))-sum(gameOverMask(:)));
    isGameOver = diff <= TOLERANCE;
end

