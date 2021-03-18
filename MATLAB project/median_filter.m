function [A] = median_filter(A,N)
    B=im2col(A,[N,N]);
    M=median(B);
    A=col2im(M,[N N],[size(A,1) size(A,2)]);
end