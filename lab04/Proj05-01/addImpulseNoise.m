function output_s = addImpulseNoise(input_s, Ps, Pp)
output_s = input_s;
[M,N]= size(input_s);
random_list = randperm(M*N);
random_matrix = reshape(random_list,M,N);
white = M * N - floor(Ps * M * N);
black = floor(Pp * M * N);

for x = 1:M
    for y = 1:N
        if random_matrix(x,y) > white
            output_s(x,y) = 255;
        elseif random_matrix(x,y) < black
            output_s(x,y) = 0;
        else
            continue;
        end
    end
end
end

