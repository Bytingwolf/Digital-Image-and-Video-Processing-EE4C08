function image = gaussianFilter(sigma, size, type, image)
sigma = input("Enter the sigma:");
size = uint8(size);
size = input("Enter the size:");
type = input("Enter the type:",'s');
sizemod = mod(size,2);
F = zeros(size,size);       %Initialising matrices for filters
H = zeros(1,size);
V = zeros(size,1);
if type == "combined"
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
    
elseif type == "separable"
    if sizemod == 1                 %For odd sized matrices
        for i = 1:size
            H(i)=exp((-(ceil(size/2)-i)^2)/(2*(sigma^2)));          %Implementation of Gaussian Function
        end
        H = H/sum(H(:));
        for j = 1:size
            V(j)=exp((-(ceil(size/2)-j)^2)/(2*(sigma^2)));          %Implementation of Gaussian Function
        end
        V = V/sum(V(:));
        F = H.*V;                   %Multiplying horizontal and vertical gaussian filters
        F = F/sum(F(:));            %Normalisation
        
    else                            %For even sized matrices
        H1 = zeros(1,size);         %Initialising matrices for filters
        H2 = zeros(1,size);
        H3 = zeros(1,size);
        H4 = zeros(1,size);
        V1 = zeros(size,1);
        V2 = zeros(size,1);
        V3 = zeros(size,1);
        V4 = zeros(size,1);
        for i = 1:size
            H1(i)=exp((-(ceil(size/2)-i)^2)/(2*(sigma^2)));         %Implementation of Gaussian Function
        end
        H1 = H1/sum(H1(:));
        for j = 1:size
            V1(j)=exp((-(ceil(size/2)-j)^2)/(2*(sigma^2)));         %Implementation of Gaussian Function
        end
        V1 = V1/sum(V1(:));
        F1 = H1.*V1;                %Multiplying horizontal and vertical gaussian filters
        F1 = F1/sum(F1(:));         %Normalisation
        
        for i = 1:size
            H2(i)=exp((-(ceil((size/2)+1)-i)^2)/(2*(sigma^2)));     %Implementation of Gaussian Function
        end
        H2 = H2/sum(H2(:));
        for j = 1:size
            V2(j)=exp((-(ceil(size/2)-j)^2)/(2*(sigma^2)));         %Implementation of Gaussian Function
        end
        V2 = V2/sum(V2(:));
        F2 = H2.*V2;                %Multiplying horizontal and vertical gaussian filters
        F2 = F2/sum(F2(:));         %Normalisation
        
        for i = 1:size
            H3(i)=exp((-(ceil(size/2)-i)^2)/(2*(sigma^2)));         %Implementation of Gaussian Function
        end
        H3 = H3/sum(H3(:));
        for j = 1:size
            V3(j)=exp((-(ceil((size/2)+1)-j)^2)/(2*(sigma^2)));     %Implementation of Gaussian Function
        end
        V3 = V3/sum(V3(:));
        F3 = H3.*V3;                %Multiplying horizontal and vertical gaussian filters
        F3 = F3/sum(F3(:));         %Normalisation
        
        for i = 1:size
            H4(i)=exp((-(ceil((size/2)+1)-i)^2)/(2*(sigma^2)));     %Implementation of Gaussian Function
        end
        H4 = H4/sum(H4(:));
        for j = 1:size
            V4(j)=exp((-(ceil((size/2)+1)-j)^2)/(2*(sigma^2)));     %Implementation of Gaussian Function
        end
        V4 = V4/sum(V4(:));
        F4 = H4.*V4;                %Multiplying horizontal and vertical gaussian filters
        F4 = F4/sum(F4(:));         %Normalisation
        
        F = F1 + F2 + F3 + F4;      %Summing all the filters
        F = F/sum(F(:));            %Normalisation
    end
else                           %Default mode as combined
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
end

figure(1),imshow(image);
image = imfilter(image, F);         %Convolving image and the final Gaussian Filter
%figure(2),imshow(image)

end