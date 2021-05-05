Cover = imread('Cover.jpg');
Message = imread('Message.jpg');
[x, y, z] = size(Message);
Cover = imresize(Cover, [x y]);
imwrite(Cover,'Cover.bmp');
imwrite(Message,'Message.bmp');
if size('Cover.bmp') ~= size('Message.bmp')
disp( 'Error: Images must have the same dimensions!')
else
Image = imread('Cover.bmp');
Hidden = imread('Message.bmp');
n = 4;
Steganog = uint8(bitor(bitand(Image, bitcmp(2^n - 1, 'uint8')), bitshift(Hidden, n - 8)));
imwrite(Steganog,'Steganog.bmp');
figure;
imshow(Steganog)
title('Steganographic Image')
end