Y = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\girlface.bmp');
%J = entropy(Y);
%figure(1);hist(Y(:),[0:255]);
figure(2);imshow(Y);
calcEntropy(Y);
fprintf('The entropy of the given image is %g\n',ans);