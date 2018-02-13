function ret = align_pyramid(ch1,ch2)

ch = ch1;

% steps = floor(min(log2(size(ch1,1)),log2(size(ch1,2))));

for step = 1:4
    ch1 = impyramid(ch1,'reduce');
    ch2 = impyramid(ch2,'reduce');
end

offset = [0,0];

low_bound = 0.2;
upper_bound = 0.8;
leny = floor(size(ch1,1));
lenx = floor(size(ch2,2));

crop1 = ch1(floor(low_bound*leny)+1:floor(upper_bound*leny),...
floor(low_bound*lenx)+1:floor(upper_bound*lenx));
crop2 = ch2(floor(low_bound*leny)+1:floor(upper_bound*leny),...
floor(low_bound*lenx)+1:floor(upper_bound*lenx));

c = normxcorr2(crop1,crop2);

[ypeak, xpeak] = find(c==max(c(:)));

offset(1) =  ypeak - size(crop1,1);
offset(2) =  xpeak - size(crop1,2);

for step = 1:4
    offset = offset.*2;
end
offset
ret = circshift(ch,offset);

end