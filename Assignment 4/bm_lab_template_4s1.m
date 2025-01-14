
%a simple single level block matcher
clear
close all
clear all

%This m file implements Block Matching
% The block size is B (set to 16 by default), Edges of the image are
% ignored. The search width is w, set to 4 by default.
% The algorithm searches for a match between blocks only when the MAE for a
% block with its co-located block in the previous frame, exceeds mae_t the
% motion threshold. This is set to 2 by default.

%%%%%%%%%%%%%%% parameters etc %%%%%%%%%%%%%%%%%%%%%%%%

name = './qonly.360x288.y'; %filename 
hres = 360; %horizontal size
vres = 288; %versical size
B = 16; %block size
w = 4; %
mae_t = 2; %motion threshold MAE per block
start_frame = 1;  %0,1,2,3,4 ...
nframes = 30;
dfdSave = cell(30,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%open the file for reading
fin = fopen(name,'rb');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%make up 2 matrices to store the motion vector components
x = (B/2):B:hres-(B/2); lx = length(x); %lx is the number of blocks across the picture
y = (B/2):B:vres-(B/2); ly = length(y); %ly is the number of blocks down the picture
bdx = zeros(ly,lx); %the horizontal component of motion
bdy = zeros(ly,lx); %the vertical component of motion

%make up an array to store dfd in a block
error = zeros(2*w+1,2*w+1); sdx = (-w:w); sdy = (-w:w);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% scan the frames
    for frame = start_frame:start_frame+nframes-1,

    fseek(fin,hres*vres*(frame-1),'bof');
    past_frame = double(fread(fin,[hres vres],'uint8')');

    fseek(fin,hres*vres*frame,'bof');
    present_frame = double(fread(fin,[hres vres],'uint8')');

    figure(1);image(past_frame);colormap(gray(256));axis image;title('Past Frame');drawnow;

    %make up non-motion compensated DFD for checking for mtoion
    non_mc_dfd = abs(present_frame-past_frame); dfd = zeros(vres,hres);
    figure(2);image(present_frame-past_frame+128);axis image;colormap(gray(256));
    title('Non motion compensated Frame Difference');
    drawnow;

    %now track where needed
    ny = 2;
    %leave out a border of BxB pels so you don't have to bother about borders
    for j = B:B:vres-B+1-B+1,  
    nx = 2;
        for i = B:B:hres-B+1-B+1,
      
          bx = i:i+B-1; by = j:j+B-1;
          reference_block = present_frame(by,bx);
      
            m = mean(mean(non_mc_dfd(by,bx)));
            if ( m > mae_t )
                error = zeros(2*w+1,2*w+1);
         
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %search for each possible block in the search window in the
                %past_frame
                %measure the mean abs dfd for every offset block
                %and assign to the right element of ERROR
         
                %REMOVE THIS LINE AND INSERT YOUR CODE HERE !!!
                for kx = -w:w,
                    for ky = -w:w,
                        past_block = past_frame(by + ky,bx + kx);
                        error(1+w+ky,1+w+kx) = mean(mean(abs(reference_block - past_block)));
                    end
                end
                    
                %error = rand(2*w+1)*255;
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         
                %now find the min error and associate that with the right vector
                [val,y_index] = min(error);
                [val,x_index] = min(val);
                bdx(ny,nx) = sdx(x_index); bdy(ny,nx) = sdy(y_index(x_index));
         
                dfd(by,bx) = reference_block-past_frame(by+bdy(ny,nx),bx+bdx(ny,nx));
                dfdSave(frame,1) = dfd;
            else
                bdx(ny,nx) = 0; bdy(ny,nx) = 0;
            end;
      
         nx = nx+1;
       end; % end of horizontal scan
        ny = ny+1;
        fprintf('%f of %f Rows in frame %f \n',ny,ly,frame);
        end; % end of vertical scan

        figure(3);image((1:hres),(1:vres),present_frame);colormap(gray(256));axis image;drawnow;
        hold on;title('Motion vectors for each block superimposed on current frame');
        h = quiver(x,y,bdx,bdy,'r-');
        set(h,'linewidth',1.25);
        dfdOfFrames(frame) = mean(mean(abs(dfd)));
        
        save DFD_test.mat dfd1_test


    end; %end of current frame

fclose(fin);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%display your dfd as figure 4!
figure(4);image(dfd);
%INSERT YOUR SINGLE LINE OF DISPLAY CODE HERE!!
figure(5);plot(dfdOfFrames);xlabel('Frame');
ylabel('En,n-1');
title('Plot En,n-1 Vs Frame');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




