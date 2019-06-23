I = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\4s1\lab1\Sigmedia06907.tif');

red_plane = I(:,:,1);
[red] = gaussianFilter2(2.5,15,"combined",red_plane);           %Applying Gaussian Filter on red channel

green_plane = I(:,:,2);
[green] = gaussianFilter2(2.5,15,"combined",green_plane);       %Applying Gaussian Filter on red channel

blue_plane = I(:,:,3);
[blue] = gaussianFilter2(2.5,15,"combined",blue_plane);         %Applying Gaussian Filter on red channel

[low_pass] = cat(3, red, green, blue);                          %Combining all channels
figure(1),imshow(I)
%figure(9),imshow(low_pass)
high_pass = I - low_pass;                                       %Calculating the high pass filter fraction of which would be used
f = 0.3;
high_pass = f*high_pass;
final = I + high_pass;
figure(2),imshow(final)
