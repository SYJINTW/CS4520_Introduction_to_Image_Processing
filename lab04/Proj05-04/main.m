clear;
close all;

inputImage = imread("./inputImage.tif");
inputImage = im2single(inputImage);

% (1) Original Image
imwrite(im2uint8(inputImage), '1.tif'); 
subplot(2,3,1),imshow(inputImage),title("Original Image");
[M,N]= size(inputImage);

F = fftshift(fft2(inputImage));
% % Original Image in frequency domain
% Fs = Fspectrum(F);
% imwrite(Fs,'2.tif');
% subplot(5,2,2),imshow(Fs),title("Original Image (F)");

%% Motion Blur
[outputImageFreq,H] = addMotionBlur(F,1,0.1,0.1);

% % Motion Blur Filter in frequency domain
% Hs = Fspectrum(H);
% imwrite(Hs,'3.tif');
% subplot(5,2,3),imshow(Hs),title("Motion Blur Filter");

% % Motion Blur Image in frequency domain
% outputImageFreqS = Fspectrum(outputImageFreq);
% imwrite(outputImageFreqS,'4.tif');
% subplot(5,2,4),imshow(outputImageFreqS),title("Motion Blur Image (F)");

% (2) Motion Blur Image in spatial domain
outputImage = ifft2(ifftshift(outputImageFreq));
outputImage = real(outputImage);
imwrite(im2uint8(outputImage),'2.tif');
subplot(2,3,2),imshow(outputImage),title("Motion Blur Image (S)");

%% Add Sinusoidal Noises
% (3) Sinusoidal Noises Image in frequency domain
outputImageNoises = addSinNoise(outputImage,0.5,150,150);
imwrite(im2uint8(outputImageNoises),'3.tif');
subplot(2,3,3),imshow(outputImageNoises),title("Sinusoidal Noises Image (S)");

%% Wiener Filter
F = fftshift(fft2(outputImage));
% (4) k = 0.0001
outputImageFreq = wienerFiltering(F, H, 0.001);
outputImage = ifft2(ifftshift(outputImageFreq));
outputImage = real(outputImage);
imwrite(im2uint8(outputImage),'4.tif');

% (5) k = 0.001
outputImageFreq = wienerFiltering(F, H, 0.01);
outputImage = ifft2(ifftshift(outputImageFreq));
outputImage = real(outputImage);
imwrite(im2uint8(outputImage),'5.tif');

% (6) k = 0.01
outputImageFreq = wienerFiltering(F, H, 0.01);
outputImage = ifft2(ifftshift(outputImageFreq));
outputImage = real(outputImage);
imwrite(im2uint8(outputImage),'6.tif');



