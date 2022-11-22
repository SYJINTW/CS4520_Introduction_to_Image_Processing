function [output] = logTransformation(input,c)
% LOGTRANSFORMATION Summary of this function goes here
% Detailed explanation goes here
output = uint8(255 * mat2gray(c * log(1+double(input))));
end

