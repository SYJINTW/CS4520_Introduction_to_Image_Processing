function [resizedImage] = resizeImage_bilinear(originalImage, scalingFactor)
    %BILINEAR Summary of this function goes here
    %   Detailed explanation goes here
    if(scalingFactor > 1)
        [rows, cols] = size(originalImage);
        resizedImage = 0;
        resizedRows = round(rows*scalingFactor);
        resizedCols = round(cols*scalingFactor);
        resizedImage = zeros(resizedRows, resizedCols);
        subCols = (resizedCols-1)/(cols-1);
        subRows = (resizedRows-1)/(rows-1);
        
        for row = 1:rows-1
            for col = 1:cols-1
                startRow = round(1+subRows*(row-1));
                endRow = round(1+subRows*(row));
                startCol = round(1+subCols*(col-1));
                endCol = round(1+subCols*(col));
                A = filledImage_bilinear(originalImage(row,col),originalImage(row,col+1),originalImage(row+1,col),originalImage(row+1,col+1),endRow-startRow+1,endCol-startCol+1);
                resizedImage(startRow:endRow,startCol:endCol) = A;
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