clear;
close all;

%% (a)
inputImage = imread("./inputImage.tif");
% inputImage = imresize(inputImage,[256,256]);
inputImage = im2single(inputImage);
imwrite(im2uint8(inputImage), 'original.tif');
subplot(3,2,1),imshow(inputImage),title("Original Image");
[M,N]= size(inputImage);

% spatial to frequency
F = fft2(inputImage);
F = myFftshift(F);
F_show = log(1+abs(F));
F_max = max(F_show(:));
F_show = im2uint8(F_show/F_max);
imwrite(F_show, 'original_fq.tif');
subplot(3,2,2),imshow(F_show),title("Original Frequency Domain");

%% (b) radii = 60
H = myGHPF(60,M,N);
H_show = log(1+abs(H));
H_max = max(H_show(:));
H_show = im2uint8(H_show/H_max);
imwrite(H_show, 'r60_mask.tif');
subplot(3,2,4),imshow(H_show),title("radii = 60");

G = F.*H;
g = ifft2(G);
g_show = abs(g);
g_max = max(g_show(:));
g_show = im2uint8(g_show/g_max);
imwrite(g_show, 'r60.tif');
subplot(3,2,3),imshow(g_show),title("radii = 60");

%% (c) radii = 160
H = myGHPF(160,M,N);
H_show = log(1+abs(H));
H_max = max(H_show(:));
H_show = im2uint8(H_show/H_max);
imwrite(H_show, 'r160_mask.tif');
subplot(3,2,6),imshow(H_show),title("radii = 160");

G = F.*H;
g = ifft2(G);
g_show = abs(g);
g_max = max(g_show(:));
g_show = im2uint8(g_show/g_max);
imwrite(g_show, 'r160.tif');
subplot(3,2,5),imshow(g_show),title("radii = 160");

