Y = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\girlface.bmp');
%figure(1);imshow(Y);
n = 5;
for i = 1:n
H = calcHaar(Y, i);
Q_step = 43;
I = Q_step*round(H/Q_step);
H = calcInvHaar(I, i);
H = uint8(H);
figure,imagesc(H); colormap gray(255);
set(gca,'dataAspectRatio',[1 1 1]);
end