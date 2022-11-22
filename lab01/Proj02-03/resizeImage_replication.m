function [resizedImage] = resizeImage_replication(originalImage, scalingFactor)
    %BILINEAR Summary of this function goes here
    %   Detailed explanation goes here
    if (scalingFactor > 1)
        [rows, cols] = size(originalImage);
        resizedImage = 0;
        resizedRows = round(rows*scalingFactor);
        resizedCols = round(cols*scalingFactor);
        resizedImage = zeros(resizedRows, resizedCols);
        
        doubleRowsImage = zeros(resizedRows, cols);
        for row = 1:rows
           for newRow = (row*scalingFactor)-(scalingFactor-1):row*scalingFactor
               doubleRowsImage(newRow,:) = originalImage(row,:);
           end
        end
        
        for col = 1:cols
           for newCol = (col*scalingFactor)-(scalingFactor-1):col*scalingFactor
               resizedImage(:,newCol) = doubleRowsImage(:,col);
           end
        end
    elseif (scalingFactor < 1)
        [rows, cols] = size(originalImage);
        resizedRows = ceil(rows*scalingFactor);
        resizedCols = ceil(cols*scalingFactor);
        resizedImage = zeros(resizedRows, resizedCols);
        for newRow = 1:resizedRows
            for newCol = 1:resizedCols
                resizedImage(newRow,newCol) = originalImage(round((newRow-1)/scalingFactor+1), round((newCol-1)/scalingFactor+1));
            end
        end     
    else
        resizedImage = originalImage;
    end
    resizedImage = uint8(resizedImage);
end 




