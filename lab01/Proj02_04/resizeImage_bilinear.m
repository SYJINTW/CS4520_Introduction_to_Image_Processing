function [resizedImage] = resizeImage_bilinear(originalImage, scalingFactor)
    %BILINEAR Summary of this function goes here
    %   Detailed explanation goes here
    if(scalingFactor > 1)
        [rows, cols] = size(originalImage);
        resizedCols = cols*scalingFactor;
        resizedRows = rows*scalingFactor;
        resizedImage = zeros(resizedCols, resizedRows);
        subCols = (resizedCols-1)/cols;
        subRows = (resizedRows-1)/rows;
        
        for row = 1:rows
            for col = 1:cols
                startCol = round(1+subCols*(col-1));
                endCol = round(1+subCols*(col));
                startRow = round(1+subRows*(row-1));
                endRow = round(1+subRows*(row));
                A = filledImage_bilinear(originalImage(col,row),originalImage(col+1,row),originalImage(col,row+1),originalImage(col+1,row+1),endCol-startCol+1,endRow-startRow+1);
                resizedImage(startCol:endCol,startRow:endRow) = A;
            end
        end
    end
end 




