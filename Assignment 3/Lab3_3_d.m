Y = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\girlface.bmp');
%figure(1);imshow(Y);
I = calcHaarLevel1(Y);
Q_step = 43;

A = (Q_step/2)*round(I/(Q_step/2));
A = calcInvHaar(A, 1);
figure(3),imagesc(A); colormap gray(255);
set(gca,'dataAspectRatio',[1 1 1]);

B = (Q_step)*round(I/(Q_step));
B = calcInvHaar(B, 1);
figure(4),imagesc(B); colormap gray(255);
set(gca,'dataAspectRatio',[1 1 1]);

C = (2*Q_step)*round(I/(2*Q_step));
C = calcInvHaar(C, 1);
figure(5),imagesc(C); colormap gray(255);
set(gca,'dataAspectRatio',[1 1 1]);