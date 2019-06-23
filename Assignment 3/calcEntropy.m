function H = calcEntropy(Y)
%Y = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\girlface.bmp');
[height, width] = size(Y);
[p,Bins] = imhist(Y);
p = p/(height*width);
sprintf("%g",sum(p));
H = -sum(p.*log2(p + 1e-10));
disp(H);
