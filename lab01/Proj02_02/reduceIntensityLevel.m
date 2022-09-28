function [quantizedImage] = reduceIntensityLevel(originalImage, intensityLevel)
    % Reducing the number of intensity levels in a image from 256 to 2, in integer powers of 2.
    quantizedImage = uint8(floor((double(originalImage)/256)*intensityLevel)*(255/(intensityLevel-1)));
end