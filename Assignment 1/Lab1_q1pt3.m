hres = 256; vres = 256;
%define the picture name
name = ['D:\Docs\Study\Digital Image and Video Processing\image_stills\lenna.256'];
%ask your demonstrator exactly what filename
%(including directory addressing) to use here
%open the file
fin = fopen(name,'rb');
%read in the picture data
% note the transpose operation ()’ is used since the picture is stored
% in row scan order from top to bottom, but Matlab reads data into
% columns
pic = double(fread(fin,[256 256])');
newpic = pic - 128;
%double() converts the image values to floating point
%double images for mathemtical use
% display the image in a figure window
figure(3);image(newpic);colormap(gray(256));shg;