originalRGB = imread('peppers.png');
h = fspecial('motion', 50, 45);
filteredRGB = imfilter(originalRGB, h);
figure, imshow(filteredRGB)