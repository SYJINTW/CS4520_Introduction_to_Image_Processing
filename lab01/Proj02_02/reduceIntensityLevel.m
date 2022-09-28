function [quantizedImage] = reduceIntensityLevel(originalImage, intensityLevel)
    % Reducing the number of intensity levels in a image from 256 to 2, in integer powers of 2.
    quantizedImage = uint8(floor(double(originalImage)/256*(2^intensityLevel))*(256/(2^intensityLevel)));
end