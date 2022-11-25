clear;
close all;

inputImage = imread("./inputImage.tif");
inputImage = im2single(inputImage);
imwrite(im2uint8(inputImage), '1.tif');
% subplot(3,2,1),imshow(inputImage),title("Original Image");
[M,N]= size(inputImage);

%% Gaussian noise
mu = 0;
sigma = 0.15;
outputImage = addGaussianNoise(inputImage,mu,sigma);
imwrite(im2uint8(outputImage), '2.tif');
% subplot(3,2,3),imshow(outputImage),title("Original Image");
fprintf("Gaussian noise: " + myPSNR(inputImage,outputImage) + "\n");

%% Salt-and-Pepper noise
% Salt noise
Ps = 0.1;
Pp = 0;
outputImage = addImpulseNoise(inputImage, Ps, Pp);
imwrite(im2uint8(outputImage), '3.tif');
fprintf("Salt noise: " + myPSNR(inputImage,outputImage) + "\n");

% Pepper noise
Ps = 0;
Pp = 0.1;
outputImage = addImpulseNoise(inputImage, Ps, Pp);
imwrite(im2uint8(outputImage), '4.tif');
fprintf("Pepper noise: " + myPSNR(inputImage,outputImage) + "\n");

% Salt-and-Pepper noise
Ps = 0.1;
Pp = 0.1;
outputImage = addImpulseNoise(inputImage, Ps, Pp);
imwrite(im2uint8(outputImage), '5.tif');
fprintf("Salt-and-Pepper noise: " + myPSNR(inputImage,outputImage) + "\n");

