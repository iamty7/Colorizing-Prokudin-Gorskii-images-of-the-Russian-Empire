function ret = align_ssd(ch1, ch2)

img1 = ch1(floor(0.1*size(ch1,1)):floor(0.9*size(ch1,1)),floor(0.1*size(ch1,2)):floor(0.9*size(ch1,2)));
img2 = ch2(floor(0.1*size(ch2,1)):floor(0.9*size(ch2,1)),floor(0.1*size(ch2,2)):floor(0.9*size(ch2,2)));


min = inf;
offset = [0,0];
for i = -15:15
    for j = -15:15
        tmp = circshift(img1,[i,j]);
        ssd = sum(sum((img2-tmp).^2));
        if min > ssd
            min = ssd;
            offset = [i,j];
        end
    end
end
offset
ret = circshift(ch1,offset);

end