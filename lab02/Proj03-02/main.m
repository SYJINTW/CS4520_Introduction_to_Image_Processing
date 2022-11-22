clear;
close all;
% (a) Write a computer program capable of reducing the number of intensity levels in a image from 256 to 2, in integer powers of 2.
% The desired number of intensity levels needs to be a variable input to your program.

inputImage = imread("./inputImage.tif");

histVector = imageHist(inputImage);
% plot(histVector);

[output,T] = histEqualization(inputImage);
histVector = imageHist(output);
% plot(T);

% imwrite(output,'enhancedOutput.tif','tif');

