clear;
close all;

f = imread('inputImage.tif');
[M, N] = size(f);

% padding
F = zeros(2 * M, 2 * N);
F(1:M, 1:N) = f;
F = im2single(F);

% (-1) mask
mask = ((-1) .^ (0:2*M-1))' * (-1) .^ (0:2*N-1);

% DFT
F = myDFT2(F .* mask);
F_show = log(1+abs(F));
F_max = max(F_show(:));
F_show = im2uint8(F_show/F_max);
imwrite(F_show, 'F.tif');

% mean vs DC coefficient
originalMean = mean2(f)
dftMean = abs(F(M + 1, N + 1)) / (M*N)
