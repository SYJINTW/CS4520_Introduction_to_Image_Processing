function [filledImage] = filledImage_bilinear(a,b,c,d,newRows,newCols)
    % [a b]
    % [c d]
    filledImage = zeros(newRows,newCols);
    A = [1,1,1,1;1,newCols,newCols,1;newRows,1,newRows,1;newRows,newCols,newRows*newCols,1]^(-1);
    B = double([a;b;c;d]);
    calMatrix = A*B;
    for row=1:newRows
        for col=1:newCols
            filledImage(row,col) = ([row,col,row*col,1])*calMatrix;
        end
    end
%     filledImage = uint8(filledImage);
end