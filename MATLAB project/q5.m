[I,fs]=imread("cameraman.tif");
I=I(:,:,1);
I=DFT2(I);
imshow(I);
function [I]=DFT2(I)
[p,q]=size(I);

[x,y]=meshgrid(1:p,1:p);
dftp=(x-1).*(y-1);
dftp=exp(-i*2*pi*dftp/p);

[x,y]=meshgrid(1:q,1:q);
dftq=(x-1).*(y-1);
dftq=exp(-i*2*pi*dftq/q);

wp=dftmtx(p);
wq=dftmtx(q);
I=double(I);
I=dftp*I;
I=I*dftq;
end