%define the picture name
name = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\4s1\lab1\Sigmedia06907.tif');
pic = rgb2gray(name);
figure(1);imshow(pic);shg;
figure(2);hist(pic(:),[0:255]);