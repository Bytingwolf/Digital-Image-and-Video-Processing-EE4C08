pic = imread('D:\Docs\Study\Digital Image and Video Processing\image_stills\4s1\lab1\pool.02.bmp');
figure(1);imshow(pic)
%pic = double(pic);

%threshold values for r, g and b planes resp.
rLow = 45;
rHigh = 120;
bLow = 25;
bHigh = 70;
gLow = 125;
gHigh = 240;

%red plane mask
red_plane = pic(:,:,1);
red_plane = double(red_plane);

red_plane(red_plane<rLow) = 0;
red_plane(red_plane<rHigh & red_plane>rLow) = 1;
red_plane(red_plane>rHigh) = 0;

%green plane mask
green_plane = pic(:,:,2);
green_plane = double(green_plane);

green_plane(green_plane<gLow) = 0;
green_plane(green_plane<gHigh & green_plane>gLow) = 1;
green_plane(green_plane>gHigh) = 0;

%blue plane mask
blue_plane = pic(:,:,3);
blue_plane = double(blue_plane);

blue_plane(blue_plane<bLow) = 0;
blue_plane(blue_plane<bHigh & blue_plane>bLow) = 1;
blue_plane(blue_plane>bHigh) = 0;

%combining all three masks
[vres hres channel] = size(pic)
size_mat = (red_plane & green_plane & blue_plane);

%figure;hist(pic(:,:,1),[0:255]);
%figure;hist(pic(:,:,2),[0:255]);
%figure;hist(pic(:,:,3),[0:255]);

%repmat(size_mat, [1,1,3]);
newpic = bsxfun(@times, pic, cast(size_mat, class(pic)));
figure(2); imshow(newpic);
