function transf = X(f,a,A)
%A - amplitude
%a - Período
%f - frequencia
for i = 1:size(f)
    transf = 2*A./(a.*(2*pi.*f).^2) .* (1-cos(2*pi.*f.*a));
end
    