clear;
close all;
% (a) Write a computer program capable of reducing the number of intensity levels in a image from 256 to 2, in integer powers of 2.
% The desired number of intensity levels needs to be a variable input to your program.

inputImage = imread("./inputImage.tif");
A = [1,2,3,4;
     5,6,7,8;
     9,10,11,12];
resizedImage = resizeImage_bilinear(inputImage, 1/12.5);
resizedImage = resizeImage_bilinear(resizedImage, 12.5);

subplot(1, 2, 1);
imshow(inputImage);
title("Original");
subplot(1, 2, 2);
imshow(resizedImage);
title("Shrinked and zoomed by factor 12.5");

imwrite(resizedImage,'outputImage.tif','tif');