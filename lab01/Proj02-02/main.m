clear;
close all;
% (a) Write a computer program capable of reducing the number of intensity levels in a image from 256 to 2, in integer powers of 2.
% The desired number of intensity levels needs to be a variable input to your program.

% inputImage = imread("./inputImage.tif");
% quantizedImage = reduceIntensityLevel(inputImage, 128);
% imshow(quantizedImage);

inputImage = imread("./inputImage.tif");
imshow(inputImage);
k = 1;
while (k <= 8)
    quantizedImage = reduceIntensityLevel(inputImage, (2^k));
    subplot(4, 2, k);
    imshow(quantizedImage);
    title("Intensity Level:" + num2str(2^k));
    imwrite(quantizedImage,['outputImage_',num2str(2^k),'.tif'],'tif');
    k = k + 1;
end