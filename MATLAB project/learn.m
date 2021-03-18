f=imread("inp2.png");
F = fft2(f);
[p,q]=size(f);
[x,y]=meshgrid(1:size(f,2),1:size(f,1));
F(36:p-36,1:q)=0;
imshow(ifft2(F)/sqrt(size(F,1)*size(F,2)));
set(gca,'visible','on')
