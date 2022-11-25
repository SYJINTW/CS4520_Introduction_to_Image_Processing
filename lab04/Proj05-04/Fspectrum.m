function Fs = Fspectrum(F)
Fs = log(1+abs(F));
mFs = max(Fs(:));
Fs = im2uint8(Fs/mFs);
end

