function output_s = addGaussianNoise(input_s,mu,sigma)
[M,N]= size(input_s);
random = randn(M,N);
% std(random,0,'all')
% [min(random,[],'all') max(random,[],'all')]

gaussian_noise = mu + (random*sigma);
% std(gaussian_noise,0,'all')
% [min(gaussian_noise,[],'all') max(gaussian_noise,[],'all')]

output_s = input_s + gaussian_noise;
% [min(output_s,[],'all') max(output_s,[],'all')]

tmp = (output_s - min(output_s,[],'all'));
output_s = (tmp/max(tmp,[],'all'));
% [min(output_s,[],'all') max(output_s,[],'all')]

tmp = (gaussian_noise - min(gaussian_noise,[],'all'));
gaussian_noise = (tmp/max(tmp,[],'all'));
imwrite(im2uint8(gaussian_noise), 'gaussian_noise.tif');

end
