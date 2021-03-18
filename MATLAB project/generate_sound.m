function [a]= generate_sound(n)
amp=10 ;
fs=44100;
duration=0.28;
num=duration*fs;
now=0;
gap=0.3;
silent=gap*fs;

freq=[  
        204,304;
        159,275;   159,304;   159,336;
        176,275;   176,304;   176,336;
        194,275;   194,304;   194,336;
        ];
number=dec2base(n,10)-'0';
number

for i=1:8;
values=0:1/fs:duration;

a(now+1:now+1+num)=amp*sin(2*pi* freq(number(i)+1,1)*values);
% a(now+1:now+1+num)=a(now+1:now+1+num)+amp*sin(2*pi* freq(number(i)+1,2)*values);
now=num+now+1;
a(now+1:now+silent+1)=0;
now=now+silent+1;

end
end
