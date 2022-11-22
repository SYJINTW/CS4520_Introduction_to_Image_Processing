function output = powerlawTransformation(input,c,r)
output_double = c * double(input).^r;
output = uint8(255 * mat2gray(output_double));
end

