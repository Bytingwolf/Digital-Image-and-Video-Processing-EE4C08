pic = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\4s1\lab1\nuclei.02.png');
[vres,hres] = size(pic);
figure(1);hist(pic(:),[0:255]);
t1 = 43;
t2 = 255;

mask = pic(:,:,1);
mask = double(mask);

mask(mask < t1) = 0;
mask(mask < t2 & mask > t1) = 1;
mask(mask > t2) = 0;

figure;imshow(pic)
figure;imshow(mask)