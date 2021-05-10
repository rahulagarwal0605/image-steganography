function Extracted = ExtractImage(img)
    Steganog = imread(img);
    n = 4;
    Extracted = uint8(bitand(255, bitshift(Steganog, 8 - n)));
    Extracted = imsharpen(Extracted);
end