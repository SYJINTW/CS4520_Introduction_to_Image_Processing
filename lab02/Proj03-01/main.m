clear;
close all;
% (a) Write a computer program capable of reducing the number of intensity levels in a image from 256 to 2, in integer powers of 2.
% The desired number of intensity levels needs to be a variable input to your program.

inputImage = imread("./inputImage.tif");

c = 1;
outputImage = logTransformation(inputImage, c);
imwrite(outputImage,'logOutput.tif','tif');

c = 1;
r = 0.1;
outputImage = powerlawTransformation(inputImage,c,r);
imwrite(outputImage,'powOutput_1.tif','tif');

c = 1;
r = 0.5;
outputImage = powerlawTransformation(inputImage,c,r);
imwrite(outputImage,'powOutput_2.tif','tif');

c = 1;
r = 0.8;
outputImage = powerlawTransformation(inputImage,c,r);
imwrite(outputImage,'powOutput_3.tif','tif');

c = 1;
r = 1.5;
outputImage = powerlawTransformation(inputImage,c,r);
imwrite(outputImage,'powOutput_4.tif','tif');

c = 1;
r = 2;
outputImage = powerlawTransformation(inputImage,c,r);
imwrite(outputImage,'powOutput_5.tif','tif');
