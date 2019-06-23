function I = calcHaarLevel1(Y) %=haar2(I)
%Y=imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\girlface.bmp');
%Y=rgb2gray(Y);

col=max(size(Y));
row=min(size(Y));
inp=Y;
op=zeros(col,row);
while(col>256)
len=0;
    while(len<2)
        for j=1:row
            for i=0:col/2-1
                op(j,i+1)=(Y(j,2*i+2)+Y(j,2*i+1))*.5;
                op(j,col/2+i+1)=(Y(j,2*i+1)-Y(j,2*i+2))*.5;
            end
        end
        Y=op';
        len=len+1;
    end
col=col/2;
row=row/2;

Y=op';
end
I = uint8(Y);
%imshow(I);