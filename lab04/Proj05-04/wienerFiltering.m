function output_f = wienerFiltering(input_f,H,K)
W = conj(H)./(conj(H).*H+K);
% W = (abs(H).^2)./((abs(H).^2)+K).*(1./H);
output_f = input_f.*W;
end

