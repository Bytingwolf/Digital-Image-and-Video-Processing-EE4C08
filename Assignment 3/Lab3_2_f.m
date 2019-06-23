Y1 = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\girlface.bmp');
figure(2);imshow(Y1);
Q_step = 43;
Y2 = Q_step*round(Y1/Q_step);
figure(3);imshow(Y2);
calcMSE(Y1, Y2);
%err = immse(Y1,Y2); 
%disp(err);
fprintf('The Mean-Squared Error between the given image and its quantised counterpart is %g\n',ans);