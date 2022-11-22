clear;
close all;

%% (a)
inputImage = imread("./inputImage.tif");
% inputImage = imresize(inputImage,[256,256]);
inputImage = im2single(inputImage);
imwrite(im2uint8(inputImage), 'a.tif');
subplot(3,3,1),imshow(inputImage),title("Original Image");
[original_M,original_N]= size(inputImage);

%% (b)
B = zeros(original_M*2,original_N*2);
B(1:original_M,1:original_N) = inputImage;
imwrite(B, 'b.tif');
subplot(3,3,2),imshow(B),title("Padding Image");

%% (c)
[M,N] = size(B);
C_mask = ((-1) .^ (0:M-1))' * (-1) .^ (0:N-1);
C = B .* C_mask;
imwrite(im2uint8(C), 'c.tif');
subplot(3,3,3),imshow(im2uint8(C)),title("Padding Image multiply by -1^{(x+y)}");

%% (d)
D = myDFT2(C);
D_show = log(1+abs(D));
D_max = max(D_show(:));
D_show = im2uint8(D_show/D_max);
imwrite(D_show, 'd.tif');
subplot(3,3,4),imshow(D_show),title("Spectrum of F");

%% (e)
E = myGLPF(10,M,N);
E_show = log(1+abs(E));
E_max = max(E_show(:));
E_show = im2uint8(E_show/E_max);
imwrite(E_show, 'e.tif');
subplot(3,3,5),imshow(E_show),title("Gaussian lowpass filter");

%% (f)
F = D.*E;
F_show = log(1+abs(F));
F_max = max(F_show(:));
F_show = im2uint8(F_show/F_max);
imwrite(F_show, 'f.tif');
subplot(3,3,6),imshow(F_show),title("G = H .* F");


%% (g)
g = myIDFT2(F);
g_mask = ((-1) .^ (0:M-1))' * (-1) .^ (0:N-1);
g_show = abs(g);
g = g .* g_mask;
g_max = max(g_show(:));
g_show = im2uint8(g_show/g_max);
imwrite(g_show, 'g.tif');
subplot(3,3,7),imshow(g_show),title("Real\{IDFT(G)\}(-1)^{x+y}");

% (h)
h = g_show(1:original_M,1:original_N);
imwrite(h, 'h.tif');
subplot(3,3,8),imshow(h),title("g(x,y)");


% (a) Write a computer program capable of reducing the number of intensity levels in a image from 256 to 2, in integer powers of 2.
% The desired number of intensity levels needs to be a variable input to your program.

% inputImage = imread("./inputImage.tif");
% quantizedImage = reduceIntensityLevel(inputImage, 128);
% imshow(quantizedImage);

% H = myGLPF(10,688,688);
% imshow(H);

% a=[1 1 3 5;
%    1 1 1 1;
%    1 1 2 1;
%    1 1 1 1];
% my_y = myFft2(a)
% y = fft2(a)
% my_y = myFftshift(my_y)
% y = fftshift(y)

% inputImage_single = im2single(imread("./test.tif"));
% y = fft2(inputImage_single);
% y_shift = fftshift(y);
% x = myIDFT2(y_shift);
% imshow(x);

% y_shift = myFftshift(y);
% y_shift_abs = abs(y_shift);
% y_shift_abs = log(1+y_shift_abs);
% y_max = max(y_shift_abs(:));
% y_shift_abs_uint8 = im2uint8(y_shift_abs/y_max);
% max(y_shift_abs_uint8(:));
% imshow(y_shift_abs_uint8);

% x = ifft2(y_shift.*H);
% x_abs = abs(x);
% x_max = max(x_abs(:));
% x_abs_uint8 = im2uint8(x_abs/x_max);
% imshow(x_abs_uint8);

% x = [ones(256,16) zeros(256,240)];
% y = fft2(x);
% y_shift = myFftshift(y);
% y_shift_abs = abs(y_shift);
% y_shift_abs_uint8 = im2uint8(y_shift_abs);
% imshow(y_shift_abs_uint8);

