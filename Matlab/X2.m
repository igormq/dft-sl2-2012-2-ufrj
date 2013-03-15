function transf = X2(f)

transf = rectpuls(f./2)+rectpuls(f./0.2);
%transf= 1/2 .* sqrt(pi./2) .* (sign(2-2.*pi.*f)+sign(2.*pi.*f+2));