function image = gaussianFilterComb(sigma, size, type, image)
%sigma = input("Enter the sigma:");
%size = uint8(size);
%size = input("Enter the size:");
%type = input("Enter the type:",'s');
sizemod = mod(size,2);
F = zeros(size,size);       %Initialising matrices for filters

if sizemod == 1            %For odd sized matrices
        for i = 1:size
            for j = 1:size
                F(i,j)=exp(-((ceil(size/2)-i).^2 + (ceil(size/2)-j).^2)/(2*(sigma^2)));     %Implementation of Gaussian Function
            end
        end
        F = F/sum(F(:));
    else                       %For even sized matrices
        for i = 1:size
            for j = 1:size
                F1(i,j)=exp(-((ceil(size/2)-i)^2 + (ceil(size/2)-j)^2)/(2*(sigma^2)));      %Implementation of Gaussian Function
            end
        end
        F1 = F1/sum(F1(:));
        for i = 1:size
            for j = 1:size
                F2(i,j)=exp(-((ceil((size/2)+1)-i)^2 + (ceil(size/2)-j)^2)/(2*(sigma^2)));  %Implementation of Gaussian Function
            end
        end
        F2 = F2/sum(F2(:));
        for i = 1:size
            for j = 1:size
                F3(i,j)=exp(-((ceil(size/2)-i)^2 + (ceil((size/2)+1)-j)^2)/(2*(sigma^2)));  %Implementation of Gaussian Function
            end
        end
        F3 = F3/sum(F3(:));
        for i = 1:size
            for j = 1:size
                F4(i,j)=exp(-((ceil((size/2)+1)-i)^2 + (ceil((size/2)+1)-j)^2)/(2*(sigma^2)));  %Implementation of Gaussian Function
            end
        end
        F4 = F4/sum(F4(:));
        F = F1 + F2 + F3 + F4;
        F = F/sum(F(:));            %Normalisation
        
end
    

%figure(1),imshow(image);
image = imfilter(image, F);         %Convolving image and the final Gaussian Filter
%figure(2),imshow(image)

end