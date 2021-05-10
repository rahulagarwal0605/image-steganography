function img = ChangeBackground(originalImage, background)
    img = imread(originalImage);
    background = imread(background);
    [x, y, z] = size(img);
    background = imresize(background, [x y]);
    gray = rgb2gray(img);
    SE  = strel('Disk',1,4);
    morphologicalGradient = imsubtract(imdilate(gray, SE),imerode(gray, SE));
    mask = im2bw(morphologicalGradient,0.03);
    SE  = strel('Disk',3,4);
    mask = imclose(mask, SE);
    mask = imfill(mask,'holes');
    mask = bwareafilt(mask,1);
    notMask = ~mask;
    mask = mask | bwpropfilt(notMask,'Area',[-Inf, 5000 - eps(5000)]);
    r = img(:,:,1);
    g = img(:,:,2);
    b = img(:,:,3);
    rb = background(:,:,1);
    gb = background(:,:,2);
    bb = background(:,:,3);
    r(~mask) = rb(~mask);
    g(~mask) = gb(~mask);
    b(~mask) = bb(~mask);
    img = cat(3,r,g,b);
    imwrite(img, 'modifiedImage.png');
end