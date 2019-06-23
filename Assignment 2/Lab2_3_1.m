I = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\4s1\lab1\Sigmedia06907.tif');
image = rgb2gray(I);
image = gaussianFilter(0,0,0,image);
figure(2),imshow(image)