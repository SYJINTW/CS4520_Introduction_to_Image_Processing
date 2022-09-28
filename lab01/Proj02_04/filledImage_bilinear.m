function [filledImage] = filledImage_bilinear(a,b,c,d,cols,rows)
    % [a b]
    % [c d]
    
    A = double([1,1,1,1;(rows),1,(rows),1;1,(cols),(cols),1;(rows),(cols),(rows)*(cols),1])^-1;
    B = double([a;b;c;d]);
    C_matrix = A * B;
    filledImage = zeros(cols,rows);
    for row = 1:rows
        for col = 1:cols
            filledImage(col,row) = uint8([row,col,row*col,1]*C_matrix);
        end
    end
end
