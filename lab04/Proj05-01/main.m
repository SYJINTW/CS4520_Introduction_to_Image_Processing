clear;
close all;

inputImage = imread("./inputImage.tif");
inputImage = im2single(inputImage);
imwrite(im2uint8(inputImage), 'original.tif');
subplot(3,2,1),imshow(inputImage),title("Original Image");
[M,N]= size(inputImage);

%% Gaussian noise
outputImage = imnoise(inputImage,'gaussian');
subplot(3,2,2),imshow(outputImage),title("Original Image");

mu = 0;
sigma = 400;
outputImage = addGaussianNoise(inputImage,mu,sigma);
outputImage = im2uint8(outputImage);
% outputImage = outputImage - min(outputImage, [], "all");
% outputImage = 255 * (outputImage / max(outputImage, [], "all"));
subplot(3,2,3),imshow(outputImage),title("Original Image");
imwrite(im2uint8(inputImage), 'gaussianNoiseImage.tif');

%% Salt-and-Pepper noise
