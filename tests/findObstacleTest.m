% TEST FIND BIRD
birdX = 215;
close all;

%%% FIRST CASE %%%%
m1 = imread('Mask6.jpg');
[cornerX,cornerY] = findObstacle(m1,birdX);
fprintf('Case1. CornerX = %d\n',cornerX);

% Print
figure
imshow(m1)
hold on
plot(cornerX,cornerY,'rx')

%%% FIRST CASE %%%%
m = imread('Mask16.jpg');
[cornerX,cornerY] = findObstacle(m,birdX);
fprintf('Case2. CornerX = %d\n',cornerX);

% Print
figure
imshow(m)
hold on
plot(cornerX,cornerY,'rx')

%%% THIRD CASE %%%
m3 = imread('Mask15.jpg');
[cornerX,cornerY] = findObstacle(m3,birdX);
fprintf('Case4. CornerX = %d\n',cornerX);

% Print 
figure
imshow(m3)
hold on
plot(cornerX,cornerY,'rx')


%%% FIRST CASE %%%%
m = imread('Mask17.jpg');
[cornerX,cornerY] = findObstacle(m,birdX);
fprintf('Case3. CornerX = %d\n',cornerX);

% Print
figure
imshow(m)
hold on
plot(cornerX,cornerY,'rx')



%%% SECOND CASE %%%
m2 = imread('Mask14.jpg');
[cornerX,cornerY] = findObstacle(m2,birdX);

% Print
figure
imshow(m2)
hold on
plot(cornerX,cornerY,'rx')


% %%% FOURTH CASE %%%
% m4 = imread('Mask12.jpg');
% [cornerX,cornerY] = findObstacle(m4,birdX);
% 
% % Print 
% figure
% imshow(m4)
% hold on
% plot(cornerX,cornerY,'rx')