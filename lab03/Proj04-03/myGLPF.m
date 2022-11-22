function H = myGLPF(D0,M,N)
% Gaussian Lowpass Filter
H = zeros(M,N);
for i=1:M
    for j=1:N
        H(i,j)= exp(-((i-M/2)^2+(j-N/2)^2)/(2*(D0^2)));
    end
end
H = single(H);
end

