clear;
close all;

inputImage = imread("./inputImage.tif");
inputImage = im2single(inputImage);

% (1)
imwrite(im2uint8(inputImage), '1.tif'); 
[M,N]= size(inputImage);

%% Add sinusoidal noise
A = 0.5;
u0 = 150;
v0 = 150;
outputImage = addSinNoise(inputImage,A,u0,v0);
fprintf("Add sinusoidal noise: " + myPSNR(inputImage,outputImage) + "\n");

% (2)
imwrite(im2uint8(outputImage), '2.tif');

% (3)
F = fftshift(fft2(outputImage));
Fs = Fspectrum(F);
imwrite(Fs,'3.tif');

%% Notch-filter
D0 = 5;
u0 = 150;
v0 = 150;
[outputImageFreq,Notch] = notchFiltering(F,D0,u0,v0);

% (4)
imwrite(im2uint8(Notch), '4.tif'); 

% (5)
outputImageFreqS = Fspectrum(outputImageFreq);
imwrite(outputImageFreqS,'5.tif');

% (6)
outputImage = ifft2(ifftshift(outputImageFreq));
outputImage = real(outputImage);
imwrite(im2uint8(outputImage),'6.tif');
fprintf("Notch-filter: " + myPSNR(inputImage,outputImage) + "\n");


