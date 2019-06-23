%define the picture name
pic = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\4s1\lab1\pool.01.bmp');
[vres,hres] = size(pic);
figure(1);imshow(pic);shg;
figure(2);hist(pic(:,:,1),[0:255]);
figure(3);hist(pic(:,:,2),[0:255]);
figure(4);hist(pic(:,:,3),[0:255]);