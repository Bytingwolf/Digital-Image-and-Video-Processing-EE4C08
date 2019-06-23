Y = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\girlface.bmp');
%figure(1);imshow(Y);
Q_step = 43;

A = (Q_step/2)*round(Y/(Q_step/2));

figure(3),imagesc(A); colormap gray(255);
set(gca,'dataAspectRatio',[1 1 1]);
Err1 = calcMSE(Y,A);                            %MSE for image with Q_step/2

B = (Q_step)*round(Y/(Q_step));
figure(4),imagesc(B); colormap gray(255);
set(gca,'dataAspectRatio',[1 1 1]);
Err2 = calcMSE(Y,B);                            %MSE for image with Q_step

C = (2*Q_step)*round(Y/(2*Q_step));
figure(5),imagesc(C); colormap gray(255);
set(gca,'dataAspectRatio',[1 1 1]);
Err3 = calcMSE(Y,C);                            %MSE for image with 2*Q_step