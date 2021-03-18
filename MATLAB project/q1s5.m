f=imread("inp2.png");
F = fft2(f);
[p,q]=size(f);
n=37;
F(n:p-n,1:q)=0;
%     F1=fftshift(F);
%     imagesc(abs(F1));
imshowpair(f,abs(ifft2(F))/sqrt(size(F,1)*size(F,2)),'montage');
set(gca,'visible','on')
