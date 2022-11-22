function [output_s] = addGaussianNoise(input_s,mu,sigma)
% ADDGAUSSIANNOISE Summary of this function goes here
%   Detailed explanation goes here
[M,N]= size(input_s);
random = randn(M,N);
gaussian_noise = (1/(sigma*(2*pi)^(1/2)))*exp(-((random - mu).^2)/(2*sigma^2));
output_s = input_s + gaussian_noise;
end

