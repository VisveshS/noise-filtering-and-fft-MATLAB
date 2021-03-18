function [GaussianFilterMatrix] = gauss_filter(N,sigma)
    valx=-(N-1)/2:1:(N-1)/2;
    valy=-(N-1)/2:1:(N-1)/2;

    valx=valx-sigma(1);
    valy=valy-sigma(2);

    valx=-valx.*valx;
    valy=-valy.*valy;
    
    valx=vpa(exp(valx),2);
    valy=vpa(exp(valy),2);

    valfull=valx.'*valy;
    Sum=sum(valfull);
    valfull=valfull/Sum;
    GaussianFilterMatrix=double(valfull);
end