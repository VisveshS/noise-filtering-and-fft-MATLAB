clear;
a=imread("cameraman.tif");
a=magic(256);
incsize=2^nextpow2(size(a,2))-size(a,2);
a=[a zeros(1:incsize)];
a=double(a);
f1=fft2(a);
tic
f2=(FFT(FFT(a).')).';
toc
tic
f5=DFT2(a);
toc
f3=fftshift(f1);
f4=fftshift(f2);
imshowpair(abs(f3),abs(f4),'montage');
% mine=FFT(a)
% actual=fft(a)
function [f] = FFT(a);
    n=size(a,1);
    f=a;
    if(n>1);
        ae=FFT(a(1:2:n-1,:));
        ao=FFT(a(2:2:n,:));
        E=0:floor(n/2)-1;
        E=exp(-i*E*2*pi/n).';
        f=[ae+E.*ao;ae-E.*ao];
    end
end
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