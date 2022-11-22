function [histVector] = imageHist(input)
%IMAGEHIST Summary of this function goes here
%   Detailed explanation goes here
[m,n,ch] = size(input);
histVector = zeros(256);
for x = 1:m
    for y = 1:n
        value = input(x,y);
        histVector(value+1) = histVector(value+1)+1;
    end
end
end

