%% K-means

data = [1.0, 1.0; ...
    1.5, 2.0; ...
    3.0, 4.0; ...
    5.0, 7.0; ...
    3.5, 5.0; ...
    4.5, 5.0; ...
    3.5, 4.5];



% center_new = [1.0, 1.0; 5.0, 7.0];
% center_new = [5.0, 7.0; 3.5, 4.5];
% center_new = [3.0, 4.0; 3.5, 4.5];
center = center_new(:,1:2);
for i=1:7
    for j=1:2
        point = data(i,:);
        mean = center(j,:);
        distance(i,j) = sqrt((point(1) - mean(1))^2+(point(2) - mean(2))^2);
    end
    if distance(i,1) <= distance(i,2)
        distance(i,3) = 1;
    else
        distance(i,3) = 2;
    end
end

center_new = [0,0,0;0,0,0];

group1 = find(distance(:,3)==1);
for i=1:size(group1,1)
    center_new(1,1) = center_new(1,1)+data(group1(i),1);
    center_new(1,2) = center_new(1,2)+data(group1(i),2);
end

group2 = find(distance(:,3)==2);
for i=1:size(group2,1)
    center_new(2,1) = center_new(2,1)+data(group2(i),1);
    center_new(2,2) = center_new(2,2)+data(group2(i),2);
end

center_new(1,1:2) = center_new(1,1:2)/size(group1,1);
center_new(2,1:2) = center_new(2,1:2)/size(group2,1);