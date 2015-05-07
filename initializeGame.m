function [limits, bird, base] = initializeGame()
    %warning('off','all')

    %%%%% OBTAIN POSITION OF THE GAME %%%%%
    pause(0.3) % Wait for the Matlab command window
    originalBase = fullScreenshot();
    img1 = rgb2gray(originalBase); % Load images
    pause(0.3) % Wait for the bird to move
    img2 = rgb2gray(fullScreenshot());
    blackImg1 = im2bw(img1);
    blackImg2 = im2bw(img2);
    difference = blackImg1-blackImg2;

    % Max values (values which have changed, like the bird moving)
    [maxRows,maxCols] = find(difference==max(difference(:)));

    % We obtain the coordinates (supposing the bird is the part of the screen
    % which is changing the most
    birdY = median(maxRows);
    birdX = median(maxCols);

    % Show the process
    % figure
    % subplot(1,4,1)
    % imshow(img1,'Border','tight')
    % subplot(1,4,2)
    % imshow(blackImg1,'Border','tight')
    % subplot(1,4,3)
    % imshow(difference,'Border','tight')
    % subplot(1,4,4)
    % imshow(blackImg1,'Border','tight')
    % hold on
    % subplot(1,4,4)
    % plot(birdX,birdY,'r.','MarkerSize',20)


    % Obtain limits
    currentX = birdX-100;
    currentY = birdY;
    while blackImg1(currentY,currentX-1) ~= 0
        currentX = currentX-1;
    end
    limitLeft = currentX;
    while blackImg1(currentY-1,currentX) ~= 0
        currentY = currentY-1;
    end
    limitTop = currentY;
    currentX = birdX;
    while blackImg1(currentY,currentX+1) ~= 0
        currentX = currentX+1;
    end
    limitRight = currentX;
    currentY = birdY;
    while blackImg1(currentY+1,currentX) ~= 0
        currentY = currentY+1;
    end
    limitBottom = currentY;
    limits = [limitLeft,limitTop,limitRight,limitBottom];

    % % Plot process to identify borders
    % figure
    % imshow(blackImg1,'Border','tight')
    % hold on
    % plot([birdX limitLeft limitLeft limitRight limitRight],[birdY birdY limitTop limitTop limitBottom],'r.-','MarkerSize',20)
    % 
    % % Plot final board
    % game = img1(limitTop:limitBottom,limitLeft:limitRight);
    % figure
    % imshow(game)


    %%%% OBTAIN X POS OF THE BIRD %%%%
    % We repeat the process to obtain an accurate position %
    B1 = img1(limitTop+1:limitBottom,limitLeft+1:limitRight);
    B2 = img2(limitTop+1:limitBottom,limitLeft+1:limitRight);
    C = (abs(B2-B1)>0);
    % Max values (values which have changed, like the bird moving)
    [maxRows,maxCols] = find(C==max(C(:)));

    % We obtain the coordinates (supposing the bird is the part of the screen
    % which is changing the most
    birdX1 = min(maxCols);
    birdX2 = max(maxCols);
    birdY1 = min(maxRows);
    birdY2 = max(maxRows);
    bird = [birdX1,birdY1,birdX2,birdY2];
    
    % Obtain the base
    base = originalBase(limitTop+1:limitBottom,limitLeft+1:limitRight,:);

    % Clean the back of the bird
    backgroundColor = base(birdY1-5,birdX1-5,:);
    base(birdY1:birdY2+1,birdX1:birdX2,1) = backgroundColor(1);
    base(birdY1:birdY2+1,birdX1:birdX2,2) = backgroundColor(2);
    base(birdY1:birdY2+1,birdX1:birdX2,3) = backgroundColor(3);
    
    % Print the base highlighting the bird
%     figure
%     imshow(B1);
%     hold on
%     plot([birdX1, birdX1, birdX2, birdX2,birdX1],[birdY1,birdY2,birdY2,birdY1,birdY1],'r.-')
%     
%     % Print the new base without the bird
%     figure
%     imshow(base);

end

