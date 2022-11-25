function [output_f,H] = addMotionBlur(input_f,T,a,b)
[M,N] = size(input_f);
H = zeros(M,N,'single');
for u = 1:M
    for v = 1:N
       tmp = (a*(u-M/2)+b*(v-N/2));
       H(u,v) = T*sinc(tmp)*exp(-1j*pi*tmp);
    end
end
output_f = input_f .* H;
end

