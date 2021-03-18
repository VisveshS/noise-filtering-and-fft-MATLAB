x=zeros(8,44100);
[x(1,:),dummy]=audioread("0.ogg");
[x(2,:),dummy]=audioread("1.ogg");
[x(3,:),dummy]=audioread("2.ogg");
[x(4,:),dummy]=audioread("3.ogg");
[x(5,:),dummy]=audioread("4.ogg");
[x(6,:),dummy]=audioread("5.ogg");
[x(7,:),dummy]=audioread("6.ogg");
[x(8,:),dummy]=audioread("7.ogg");
[x(9,:),dummy]=audioread("8.ogg");
[x(10,:),dummy]=audioread("9.ogg");
[Y,fs]=audioread("tone.wav");
[Y,fs]=resample(Y,44100,4000);
Y=Y.*2/3;
zton=1:1:10;
for i=0:7;
    i;
    start=i.*26666+2;
	finish=start+9999;
	N=abs(real(fft(Y(start:finish))));
    crop=real(N)<50;
    N(crop)=0;
    [peaks,locations]=findpeaks(N);
    maxindex=0;
    max=0;
    for j=0:9;
        N=abs(real(fft(x(1+j,1:10000))));
%         subplot(10,1,j+1);
%         plot(N);
        crop=real(N)<200;
        N(crop)=0;
        [peak,location]=findpeaks(N);
        [commonx,commony]=size(intersect(locations,location.'));
        if commonx*commony>max;
            max=commonx*commony;
            maxindex=j;
        end
    end
     disp(maxindex+1)
end 