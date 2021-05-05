Steganog = imread('Steganog.bmp');
n = 4;
Extracted = uint8(bitand(255, bitshift(Steganog, 8 - n)));
figure;
imshow(Extracted)
title('Extracted Image')