% TEST FIND BIRD
birdX = 215;

%%% FIRST CASE %%%%
m1 = imread('Mask1.jpg');
birdY = findBird(m1,birdX);

% Print
figure
subplot(2,2,1)
imshow(m1)
hold on
plot(birdX,birdY,'rx')

%%% SECOND CASE %%%
m2 = imread('Mask11.jpg');
birdY = findBird(m2,birdX);

% Print
subplot(2,2,2)
imshow(m2)
hold on
plot(birdX,birdY,'rx')

%%% THIRD CASE %%%
m3 = imread('Mask12.jpg');
birdY = findBird(m3,birdX);

% Print 
subplot(2,2,3)
imshow(m3)
hold on
plot(birdX,birdY,'rx')

%%% FOURTH CASE %%%
m4 = imread('Mask13.jpg');
birdY = findBird(m4,birdX);

% Print
subplot(2,2,4)
imshow(m4)
hold on
plot(birdX,birdY,'rx')