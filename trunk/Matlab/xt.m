function x=xt(t,a,A)
%a=1e-3;A=1;
%A - amplitude
%a - período
    if (t>-a)
        if (t<0)
            x=A*t/a+A;
        else
            if (t<a)
                x=-A*t/a+A;
            else
                x=0;
            end
        end
    else
        x=0;
    end

end