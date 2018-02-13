function ret = starter(imname)
fullim = imread(imname);
fullim = im2double(fullim);

len = floor(size(fullim, 1) / 3);

B = fullim(1:len,:);
G = fullim(len+1:2*len,:);
R = fullim(2*len+1:3*len,:);

% original align
% outputim = cat(3,R,G,B);
% figure, imshow(outputim)
% imwrite(outputim,'6_unaligned.jpg');

% ssd align
aG = align_ssd(G,B);
aR = align_ssd(R,B);
outputim = cat(3,aR,aG,B);
figure, imshow(outputim)
% imwrite(outputim,'1_align_b.jpg');

% NCC align
% aG = align_ncc(G,B);
% aR = align_ncc(R,B);
% outputim = cat(3,aR,aG,B);
% figure, imshow(outputim)
% imwrite(outputim,'2_align_b.jpg');



% NCC align crop
% aG = align_ncc_crop(G,B);
% aR = align_ncc_crop(R,B);
% outputim = cat(3,aR,aG,B);
% figure, imshow(outputim)
% imwrite(outputim,'6_align_b.jpg');



% pyramid
% aG = align_pyramid(G,B);
% aR = align_pyramid(R,B);
% outputim = cat(3,aR,aG,B);
% figure, imshow(outputim)
% imwrite(outputim,'11_pyramid.tif');


% crop iamges
% rect = get_border(aG,B,5);
% outputim = imcrop(outputim,rect);
% figure, imshow(outputim);
% imwrite(outputim,'2_crop.jpg');

% Adjusting Contrast
% figure, imshow(imadjust(outputim,[0.1,0.1,0.1;0.9,0.9,0.9],[0,0,0;1,1,1]))
% imwrite(outputim,'3_contrast.jpg');

% cropping


end
    