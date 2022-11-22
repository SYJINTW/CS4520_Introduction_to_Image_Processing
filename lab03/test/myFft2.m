function fft2Image = myFft2(inputImage)
[w,h] = size(inputImage);
fft2Image = zeros(w,h);
% freq domain
for u = 1:w
    for v = 1:h
        % spatial domain
        for x = 1:w
            for y = 1:h
                tmp = inputImage(x,y)*exp(-2j*pi*((u-1)*(x-1)/w+(v-1)*(y-1)/h));
                fft2Image(u,v) = fft2Image(u,v) + tmp;
            end
        end
    end
end
end

