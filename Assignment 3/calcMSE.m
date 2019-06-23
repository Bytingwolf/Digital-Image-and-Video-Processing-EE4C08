function MSE = calcMSE(Y1, Y2)
Y1 = cast(Y1, 'double');
Y2 = cast(Y2, 'double');
[height, width] = size(Y1);
error = Y1 - (Y2);
MSE = sum(sum(error .* error)) / (height * width);
%disp(MSE);
end