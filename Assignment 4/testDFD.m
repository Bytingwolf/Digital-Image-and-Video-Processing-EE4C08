function testDFD()
% test the DFD script

% Usage
% Make sure that the dfd of the first three frames are stored in the respective variables "dfd1_test", "dfd2_test", and "dfd3_test" respectively, in the mat file "DFD_test.mat".
% testDFD()

load('DFD.mat')

if (exist('DFD_test.mat','file'))
    load('DFD_test.mat')
else
    fprintf('DFD test file is missing\n');
end


if (exist('dfd1_test','var'))
    % checking the DFD result for frame = 1


    e = sum(sum(abs(dfd1_test - dfd1)));
    if (sum(sum(abs(dfd1_test - dfd1))) < 1e-7)
        fprintf('frame 1 DFD: OK\n');
    else 
        fprintf('frame 1 DFD: FAILED (err=%f)\n', e);
    end
else 
   fprintf('frame 1 DFD: NOT IMPLEMENTED\n');
end



if (exist('dfd2_test','var'))
    % checking the DFD result for frame = 2

    e = sum(sum(abs(dfd2_test - dfd2)));
    if (sum(sum(abs(dfd2_test - dfd2))) < 1e-7)
        fprintf('frame 2 DFD: OK\n');
    else 
        fprintf('frame 2 DFD: FAILED (err=%f)\n', e);
    end
else 
   fprintf('frame 2 DFD: NOT IMPLEMENTED\n');
end




if (exist('dfd3_test','var'))
    % checking the DFD result for frame = 3

    e = sum(sum(abs(dfd3_test - dfd3)));
    if (sum(sum(abs(dfd3_test - dfd3))) < 1e-7)
        fprintf('frame 3 DFD: OK\n');
    else 
        fprintf('frame 3 DFD: FAILED (err=%f)\n', e);
    end
else 
   fprintf('frame 3 DFD: NOT IMPLEMENTED\n');
end