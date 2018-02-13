function ret = align_ncc(img1, img2)


offset = [0,0];


c = normxcorr2(img1,img2);

[ypeak, xpeak] = find(c==max(c(:)));

offset(1) = ypeak - size(img1,1);
offset(2) = xpeak - size(img1,2);

offset

ret = circshift(img1,offset);

end