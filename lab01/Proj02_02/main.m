clear;
close all;
% (a) Write a computer program capable of reducing the number of intensity levels in a image from 256 to 2, in integer powers of 2.
% The desired number of intensity levels needs to be a variable input to your program.
k = 1;
while (k <= 8)
    inputImage = imread("../DIP3E_Original_Images_CH02\Fig0221(a)(ctskull-256).tif");
    quantizedImage = reduceIntensityLevel(inputImage, k);
    subplot(4, 2, k);
    imshow(quantizedImage);
    title("Intensity Level:" + num2str(k));
    k = k + 1;
end