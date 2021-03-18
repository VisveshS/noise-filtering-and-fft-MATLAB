function [result] = q7s1(y,Window,stride)
    [p,q]=size(y);
    iterator = floor((size(y,1)-Window)/stride);
    output = zeros(iterator+1,Window+1);
    [p1,q1]=size(output);
    result = zeros(iterator+1,floor(q1/2));
    for i = 1:iterator-1
        f_y = fftshift(fft(y(i*stride:Window + i*stride)));
        display(i,1:size(f_y)) = abs(f_y);
    end
    display = log(display +1);
    display = mat2gray(display);
    result = display(1:min(size(result,1),floor(Window/2)) ,floor(end/2) + 1:end);
    imshow(result);
    title('chirp.wav');
end
