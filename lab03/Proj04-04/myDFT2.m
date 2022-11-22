function dft2Image = myDFT2(inputImage)
[M,N] = size(inputImage);
%% [method 1]
% dft2Image = zeros(M,N);
% % freq domain
% for u = 1:M
%     for v = 1:N
%         % spatial domain
%         for x = 1:M
%             for y = 1:N
%                 tmp = inputImage(x,y)*exp(-2j*pi*((u-1)*(x-1)/M+(v-1)*(y-1)/N));
%                 dft2Image(u,v) = dft2Image(u,v) + tmp;
%             end
%         end
%     end
% end

%% [method 2]
% row 1D DFT
rowMatrix = exp(-2j * pi * ((0:M-1)' * (0:M-1)) / M);
% column 1D DFT
colMatrix = exp(-2j * pi * ((0:N-1)' * (0:N-1)) / N);
% 2D DFT
dft2Image = rowMatrix * inputImage * colMatrix;
end

