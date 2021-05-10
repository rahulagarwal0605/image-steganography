function textString = ExtractText(img)
    filename = img;
    input_image = imread(filename);
    height = size(input_image, 1);
    width = size(input_image, 2);
    message_length = height*width;
    counter = 1;
    for i = 1 : height
        for j = 1 : width
            if (counter <= message_length)
                extracted_bits(counter, 1) = mod(double(input_image(i, j)), 2);
                counter = counter + 1;
            end
        end
    end
    binValues = [ 128 64 32 16 8 4 2 1 ];
    binMatrix = reshape(extracted_bits, 8, (message_length/8));
    textString = char(binValues*binMatrix);
    textString = split(textString, '^C');
    textString = textString(1,1);
end