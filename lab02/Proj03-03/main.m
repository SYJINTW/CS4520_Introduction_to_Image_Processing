clear;
close all;

inputImage = imread("./inputImage.tif");

mask = [1,1,1;1,1,1;1,1,1];
outputImage = uint8(spatialFiltering(inputImage, mask)/9);
imwrite(outputImage,'outputImage_a.tif','tif');

laplacianMaskA = [0,1,0;1,-4,1;0,1,0];
scale = -2;
[outputImage, scaledLaplacian] = laplacianFiltering(inputImage, laplacianMaskA, scale);
imwrite(scaledLaplacian,'outputImage_b.tif','tif');

laplacianMaskA = [0,1,0;1,-4,1;0,1,0];
scale = -1;
[outputImage, scaledLaplacian] = laplacianFiltering(inputImage, laplacianMaskA, scale);
imwrite(outputImage,'outputImage_c.tif','tif');

laplacianMaskB = [1,1,1;1,-8,1;1,1,1];
scale = -1;
[outputImage, scaledLaplacian] = laplacianFiltering(inputImage, laplacianMaskB, scale);
imwrite(outputImage,'outputImage_d.tif','tif');

% compare scale
laplacianMaskA = [0,1,0;1,-4,1;0,1,0];
scale = -0.1;
[outputImage, scaledLaplacian] = laplacianFiltering(inputImage, laplacianMaskA, scale);
imwrite(outputImage,'outputImage_01.tif','tif');
scale = -0.5;
[outputImage, scaledLaplacian] = laplacianFiltering(inputImage, laplacianMaskA, scale);
imwrite(outputImage,'outputImage_05.tif','tif');
laplacianMaskA = [0,1,0;1,-4,1;0,1,0];
scale = -1;
[outputImage, scaledLaplacian] = laplacianFiltering(inputImage, laplacianMaskA, scale);
imwrite(outputImage,'outputImage_1.tif','tif');
scale = -5;
[outputImage, scaledLaplacian] = laplacianFiltering(inputImage, laplacianMaskA, scale);
imwrite(outputImage,'outputImage_5.tif','tif');
