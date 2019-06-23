function img = gaussianFilter2(sigma, size, type, img)
%figure(1),imshow(img);
%sigma = 2.5;
%size = 15;
F = zeros(size,size);       %Initialising matrices for filters

for i = 1:size
    for j = 1:size
       F(i,j)=exp(-((ceil(size/2)-i).^2 + (ceil(size/2)-j).^2)/(2*(sigma^2)));     %Implementation of Gaussian Function
    end
end
        F = F/sum(F(:));

img = imfilter(img, F);         %Convolving image and the final Gaussian Filter
%figure ,imshow(img)

end