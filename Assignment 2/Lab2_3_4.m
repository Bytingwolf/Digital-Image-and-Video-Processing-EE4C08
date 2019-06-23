I = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\4s1\lab1\Sigmedia06907.tif');
image = rgb2gray(I);
figure(1),imshow(image);
tic
for i = 1:1000
    image = gaussianFilterComb(1,21,"combined",image);
end
toc
t = toc;
figure(2),imshow(image);