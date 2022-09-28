clear;
close all;
% (a) Write a computer program capable of reducing the number of intensity levels in a image from 256 to 2, in integer powers of 2.
% The desired number of intensity levels needs to be a variable input to your program.
inputImage = imread("../DIP3E_Original_Images_CH02\Fig0220(a)(chronometer 3692x2812  2pt25 inch 1250 dpi).tif");
resizedImage = resizeImage_bilinear(inputImage, 2);
imshow(resizedImage);

% test = filledImage_bilinear(1,2,3,4,5,4);