function ret = get_border(ch1, ch2, threshold)

% crop y axis
d = ones(size(ch1,1),1);
for row = 1:size(ch1,1)
   d(row,1) = pdist([ch1(row,:);ch2(row,:)]);
end

top = 0;
bottom = size(ch1,1);

for row = 2:floor(size(ch1,1)/2)
    if abs(d(row,1) - d(row-1,1)) > threshold
        top = row;
    end
end

for row = size(ch1,1):floor(size(ch1,1)/2)
    if abs(d(row,1) - d(row-1,1)) > threshold
        bottom = row;
    end
end

% figure,plot(d)
% plot diff of distance of rows
% figure,plot(diff(d))



% crop x axis
ch1 = ch1';
ch2 = ch2';

d = ones(size(ch1,1),1);
for row = 1:size(ch1,1)
   d(row,1) = pdist([ch1(row,:);ch2(row,:)]);
end

left = 0;
right = size(ch1,2);
for row = 2:floor(size(ch1,2)/2)
    if abs(d(row,1) - d(row-1,1)) > threshold
        left = row;
    end
end

for row = size(ch1,2):floor(size(ch1,2)/2)
    if abs(d(row,1) - d(row-1,1)) > threshold
        right = row;
    end
end
% figure,plot(d)
% figure,plot(diff(d))

ret = [left,top,right-left+1,bottom-top+1];

end