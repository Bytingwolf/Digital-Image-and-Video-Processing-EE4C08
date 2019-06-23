function H = calcHaar(Y, n)
if n == 1
    H = calcHaarLevel1(Y);
else
    H = calcHaarLevel1(Y);
    H = calcHaar(H(1:size(H/(2^n)),1:size(H/(2^n))),n-1);
end