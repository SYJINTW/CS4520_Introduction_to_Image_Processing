clear;
close all;

inputImage = imread("./inputImage.tif");
inputImage = im2single(inputImage);

% (1)
imwrite(im2uint8(inputImage), '1.tif'); 
subplot(5,2,1),imshow(inputImage),title("Original Image");
[M,N]= size(inputImage);

%% Add sinusoidal noise
A = 0.5;
u0 = 150;
v0 = 150;
outputImage = addSinNoise(inputImage,A,u0,v0);

psnrValue = myPSNR(im2uint8(inputImage), im2uint8(outputImage));
fprintf('%d\n',psnrValue);

% (2)
imwrite(im2uint8(outputImage), '2.tif');
subplot(5,2,3),imshow(outputImage),title("Sinsoidal Noise Image (S)");

% (3)
F = fftshift(fft2(outputImage));
Fs = Fspectrum(F);
imwrite(Fs,'3.tif');
subplot(5,2,4),imshow(Fs),title("Sinsoidal Noise Image (F)");

%% Notch-filter
D0 = 5;
u0 = 150;
v0 = 150;
[outputImageFreq,Notch] = notchFiltering(F,D0,u0,v0);

% (4)
imwrite(im2uint8(Notch), '4.tif'); 
subplot(5,2,5),imshow(Notch),title("Notch-filter");

% (5)
outputImageFreqS = Fspectrum(outputImageFreq);
imwrite(outputImageFreqS,'5.tif');
subplot(5,2,6),imshow(outputImageFreqS),title("Notch-filter Image (F)");

% (6)
outputImage = ifft2(ifftshift(outputImageFreq));
outputImage = real(outputImage);
imwrite(im2uint8(outputImage),'6.tif');
subplot(5,2,7),imshow(outputImage),title("Notch-filter Image (S)");

psnrValue = myPSNR(im2uint8(inputImage), im2uint8(outputImage));
fprintf('%d\n',psnrValue);
