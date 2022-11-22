function idft2Image = myIDFT2(inputImage)
%% method 1
% [w,h] = size(inputImage);
% idft2Image = zeros(w,h);
% % freq domain
% for x = 1:w
%     for y = 1:h
%         % spatial domain
%         for u = 1:w
%             for v = 1:h
%                 tmp = inputImage(x,y)*exp(2j*pi*((u-1)*(x-1)/w+(v-1)*(y-1)/h));
%                 idft2Image(u,v) = idft2Image(u,v) + tmp;
%             end
%         end
%     end
% end
% idft2Image = idft2Image/(w*h);

%% method 2
[M, N] = size(inputImage);
% row 1D DFT
rowMatrix = exp(-2j * pi * ((0:M-1)' * (0:M-1)) / M);
% column 1D DFT
colMatrix = exp(-2j * pi * ((0:N-1)' * (0:N-1)) / N);
% 2D IDFT
idft2Image = rowMatrix' * (inputImage / (M * N)) * colMatrix';
end

