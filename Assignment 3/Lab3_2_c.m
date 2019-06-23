Y = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\girlface.bmp');
%J = entropy(Y);
%figure(1);hist(Y(:),[0:255]);
figure(2);imshow(Y);
Q_step = 43;
Y = Q_step*round(Y/Q_step);
figure(3);imshow(Y);
calcEntropy(Y);
fprintf('The entropy of the quantised version of the given image is %g\n',ans);