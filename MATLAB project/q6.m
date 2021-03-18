A=imread("cameraman.tif");
B=abs(fft2(fliplr(flip(fft2(A)))));
imshowpair(A,B,'montage');