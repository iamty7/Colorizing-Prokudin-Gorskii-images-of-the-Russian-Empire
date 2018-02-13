function ret = align_ncc_crop(img1, img2)


offset = [0,0];

low_bound = 0.2;
upper_bound = 0.8;
leny = floor(size(img1,1));
lenx = floor(size(img1,2));

crop1 = img1(floor(low_bound*leny)+1:floor(upper_bound*leny),...
floor(low_bound*lenx)+1:floor(upper_bound*lenx));
crop2 = img2(floor(low_bound*leny)+1:floor(upper_bound*leny),...
floor(low_bound*lenx)+1:floor(upper_bound*lenx));

c = normxcorr2(crop1,crop2);

[ypeak, xpeak] = find(c==max(c(:)));

offset(1) =  ypeak - size(crop1,1);
offset(2) =  xpeak - size(crop1,2);

offset

ret = circshift(img1,offset);

end