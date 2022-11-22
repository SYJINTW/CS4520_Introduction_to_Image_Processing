function [output,T] = histEqualization(input)    
% LOGTRANSFORMATION Summary of this function goes here
% Detailed explanation goes here
[m,n,ch] = size(input);
output = zeros(m,n);
histVector = imageHist(input);
T = zeros(256);

prev = 0;
for i=1:256
    T(i) = prev + 255*(histVector(i))/(m*n);
    prev = T(i);
end
t = 1:1:256;
stairs(T);

for x = 1:m
    for y = 1:n
        value = input(x,y);
        output(x,y) = T(value+1);
    end
end
output = uint8(output);
T = imageHist(output);

end

