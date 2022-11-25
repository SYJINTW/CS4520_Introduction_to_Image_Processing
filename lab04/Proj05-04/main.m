clear;
close all;

inputImage = imread("./inputImage.tif");
inputImage = im2single(inputImage);

% (1) Original Image
imwrite(im2uint8(inputImage), '1.tif'); 
[M,N]= size(inputImage);

F = fftshift(fft2(inputImage));

%% Motion Blur
T = 1;
a = 0.1;
b = 0.1;
[outputImageFreq,H] = addMotionBlur(F,T,a,b);

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
fprintf("Motion Blur: " + myPSNR(inputImage,outputImage) + "\n");

%% Add Sinusoidal Noises
% (3) Sinusoidal Noises Image in frequency domain
outputImageNoises = addSinNoise(outputImage,0.5,150,150);
imwrite(im2uint8(outputImageNoises),'3.tif');
fprintf("Add Noises: " + myPSNR(inputImage,outputImageNoises) + "\n");

%% Wiener Filter
F = fftshift(fft2(outputImageNoises));
% (4) k = 0.0001
k = 0.0001;
outputImageFreq = wienerFiltering(F, H, k);
outputImage = ifft2(ifftshift(outputImageFreq));
outputImage = real(outputImage);
imwrite(im2uint8(outputImage),'4.tif');
fprintf("Wiener Filter k=" + k + ": " + myPSNR(inputImage,outputImage) + "\n");

% (5) k = 0.001
k = 0.001;
outputImageFreq = wienerFiltering(F, H, k);
outputImage = ifft2(ifftshift(outputImageFreq));
outputImage = real(outputImage);
imwrite(im2uint8(outputImage),'5.tif');
fprintf("Wiener Filter k=" + k + ": " + myPSNR(inputImage,outputImage) + "\n");

% (6) k = 0.01
k = 0.01;
outputImageFreq = wienerFiltering(F, H, k);
outputImage = ifft2(ifftshift(outputImageFreq));
outputImage = real(outputImage);
imwrite(im2uint8(outputImage),'6.tif');
fprintf("Wiener Filter k=" + k + ": " + myPSNR(inputImage,outputImage) + "\n");



