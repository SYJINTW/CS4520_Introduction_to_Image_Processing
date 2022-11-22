function [output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, scale)
%LAPLACIANFILTERING Summary of this function goes here
%   Detailed explanation goes here
scaledLaplacian = scale * spatialFiltering(input, laplacianMask);
output = uint8(double(input) + double(scaledLaplacian));
scaledLaplacian = uint8(scaledLaplacian);
end

