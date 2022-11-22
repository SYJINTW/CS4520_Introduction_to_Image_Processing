function shiftImage = myFftshift(inputImage)
[w,h] = size(inputImage);
shiftImage = zeros(w,h);
% A = (1:w/2, 1:h/2)
% B = (w/2+1:w, 1:h/2)
% C = (1:w/2, h/2+1:h)
% D = (w/2+1:w, h/2+1:h)
% fftshift
% D -> A
shiftImage(1:w/2,1:h/2) = inputImage(w/2+1:w,h/2+1:h);
% C -> B
shiftImage(w/2+1:w, 1:h/2) = inputImage(1:w/2, h/2+1:h);
% B -> C
shiftImage(1:w/2, h/2+1:h) = inputImage(w/2+1:w, 1:h/2);
% A -> D
shiftImage(w/2+1:w, h/2+1:h) = inputImage(1:w/2, 1:h/2);
end

