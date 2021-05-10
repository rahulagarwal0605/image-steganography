function Steganog = HideImage(coverImage, secretImage)
    Cover = imread(coverImage);
    Message = imread(secretImage);
    [x, y, z] = size(Message);
    Cover = imresize(Cover, [x y]);
    imwrite(Cover,'Cover.bmp');
    imwrite(Message,'Message.bmp');
    Image = imread('Cover.bmp');
    Hidden = imread('Message.bmp');
    delete *.bmp;
    n = 4;
    Steganog = uint8(bitor(bitand(Image, bitcmp(2^n - 1, 'uint8')), bitshift(Hidden, n - 8)));
    imwrite(Steganog, 'stegoImage.bmp');
end