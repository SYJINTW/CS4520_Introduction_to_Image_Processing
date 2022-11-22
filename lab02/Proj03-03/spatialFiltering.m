function output = spatialFiltering(input, mask)
%SPATIALFILTERING Summary of this function goes here
%   Detailed explanation goes here
[m,n,ch] = size(input);
output = zeros(m,n);
for x=1:m
    for y=1:n
       if (x == 1) || (x == m) || (y == 1) || (y == n)
           output(x,y) = input(x,y);
       else
           values = double(input(x-1:x+1,y-1:y+1)).*double(mask);
           output(x,y) = sum(values, "all");
       end
    end
end
end

