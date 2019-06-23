Y = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\girlface.bmp');
%figure(1);imshow(Y);
n = 5;
H = calcHaar(Y, n);
figure(1);imshow(H);