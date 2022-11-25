function results = myPSNR(refImage,tarImage)
[M,N] = size(refImage);
results = 10*log10((M*N*255^2)/(sum(abs(refImage - tarImage),'all')));
end

