disp('DIP Project: Image Stagenography');
prompt = '\n1. Text Hiding and Extraction \n2. Image Hiding and Extraction\n\nSelect an option : ';
n = input(prompt);
switch n
    case 1
        prompt = '\n1. Text Hiding\n2. Text Extraction\n\nSelect an option : ';
        n = input(prompt);
        switch n
            case 1
                img = input('\nEnter Image Name (''sample.jpg'') : ');
                msg = input('Enter Secret Message (''Secret Message'') : ');
                ChangeBackground(img, 'background.jpg');
                imshow(HideText('modifiedImage.png', msg));
            case 2
                img = input('\nEnter Image Name (''stegoImage.png'') : ');
                disp(ExtractText(img));
            otherwise
                disp('Select either 1 or 2')
        end
    case 2
        prompt = '\n1. Image Hiding\n2. Image Extraction\n\nSelect an option : ';
        n = input(prompt);
        switch n
            case 1
                coverImage = input('\nEnter Cover Image Name (''sample.jpg'') : ');
                secretImage = input('Enter Secret Image Name (''secret.jpg'') : ');
                ChangeBackground(coverImage, 'background.jpg');
                imshow(HideImage('modifiedImage.png', secretImage));
            case 2
                img = input('\nEnter Image Name with .bmp extension (''stegoImage.bmp'') : ');
                imshow(ExtractImage(img));
            otherwise
                disp('Select either 1 or 2')
        end
    otherwise
        disp('Select either 1 or 2')
end
