Y = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\girlface.bmp');
%figure(1);imshow(Y);
I = calcHaarLevel1(Y);
Q_step = uint8(43);

A = (Q_step/2)*round(I/(Q_step/2));
A = calcInvHaar(A, 1);
A = uint8(A);
figure(3),imagesc(A); colormap gray(255);
set(gca,'dataAspectRatio',[1 1 1]);
lolo = calcEntropy(A(1:256,1:256));
hilo = calcEntropy(A(257:512,1:256));
lohi = calcEntropy(A(1:256,257:512));
hihi = calcEntropy(A(257:512,257:512));
E1 = (lolo + hilo + lohi + hihi)/4;             %Entropy for image with Q_step/2
Err1 = calcMSE(Y,A);                            %MSE for image with Q_step/2

B = (Q_step)*round(I/(Q_step));
B = calcInvHaar(B, 1);
B = uint8(B);
figure(4),imagesc(B); colormap gray(255);
set(gca,'dataAspectRatio',[1 1 1]);
lolo = calcEntropy(B(1:256,1:256));
hilo = calcEntropy(B(257:512,1:256));
lohi = calcEntropy(B(1:256,257:512));
hihi = calcEntropy(B(257:512,257:512));
E2 = (lolo + hilo + lohi + hihi)/4;             %Entropy for image with Q_step
Err2 = calcMSE(Y,B);                            %MSE for image with Q_step

C = (2*Q_step)*round(I/(2*Q_step));
C = calcInvHaar(C, 1);
C = uint8(C);
figure(5),imagesc(C); colormap gray(255);
set(gca,'dataAspectRatio',[1 1 1]);
lolo = calcEntropy(C(1:256,1:256));
hilo = calcEntropy(C(257:512,1:256));
lohi = calcEntropy(C(1:256,257:512));
hihi = calcEntropy(C(257:512,257:512));
E3 = (lolo + hilo + lohi + hihi)/4;             %Entropy for image with 2*Q_step
Err3 = calcMSE(Y,C);                            %MSE for image with 2*Q_step