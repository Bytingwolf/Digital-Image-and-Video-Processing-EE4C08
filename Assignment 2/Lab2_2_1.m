%define the picture name
name = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\4s1\lab1\Sigmedia06907.tif');
pic = rgb2gray(name);
figure(1);imshow(pic);shg;
%figure(2);hist(pic(:),[0:255]);

t1 = 55;
t2 = 200;

mask = double(pic);

mask = (mask - t1)./(t2-t1);
mask = mask*255;

figure; imshow(uint8(mask));





%figure(3);hist(mask(:),[0:255]);
%figure;imshow(mask)