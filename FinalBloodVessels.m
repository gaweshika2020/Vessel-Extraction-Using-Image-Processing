clc
clear

originalImage = imread('heart3.png');
imshow(originalImage);

grayImage = rgb2gray(originalImage);
imshow(grayImage);


pkg load image

binaryImage = im2bw(grayImage, 0.32);
imshow(binaryImage);

negImage = imcomplement(binaryImage);
imshow(negImage);

noiseFreeImage = medfilt2(negImage,[3 3]);
imshow(noiseFreeImage);

pkg load image

% Step 1: Apply morphological closing operator
se = strel('disk', 15 ,0); % Adjust the structuring element size as needed
closedImage = imclose(grayImage, se);
imshow(closedImage);

thresholdValue = 43; % Adjust as needed
higherPixelValuesImage = closedImage > thresholdValue;
imshow(higherPixelValuesImage);

%%openImage = bwareaopen(higherPixelValuesImage, 130);
%%imshow(openImage);

%%filteredImage = medfilt2(openImage,[3 3]);
%%imshow(filteredImage);

binaryImage1 = im2bw(higherPixelValuesImage, 0.35);
imshow(binaryImage1);

negImage1 = imcomplement(binaryImage1);
imshow(negImage1);


%imshow(noiseFreeImage);figure;imshow(negImage1);

output = noiseFreeImage - negImage1;
imshow(output);


