function [filledImage] = filledImage_replication(a,b,c,d,scalingFactor)
    % [a b]
    % [c d]

    filledImage = zeros(scalingFactor,scalingFactor);
    filledImage(1:scalingFactor,1:scalingFactor) = a;
    filledImage(1:scalingFactor,scalingFactor+1:scalingFactor*2) = b;
    filledImage(scalingFactor+1:scalingFactor*2,1:scalingFactor) = c;
    filledImage(scalingFactor+1:scalingFactor*2,scalingFactor+1:scalingFactor*2) = d;
    
end
