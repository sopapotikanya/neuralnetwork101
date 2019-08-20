% input = [0.866;  0.5];
% input = [-0.985; -0.174];
% input = [0.342;  -0.94];


% weight = [-0.966 -0.259; ...
%       0.906 0.423];
input = [2; 0; -1];
d = -1;

% weight = [0.886; 0; 1.057];
weight = [1; 0; 1];
ramda = 1;  
net = weight'*input;
  
output(1,1) = 2/(1+exp(-ramda*net(1,1)))-1;
% output(2,1) = 2/(1+exp(-ramda*net(2,1)))-1;

f = (1-output^2)/2;
new_W = weight + (0.1)*(d-output)*f*input;


input = [1; -2; -1];
d = 1;
weight = new_W;
net = weight'*input;
  
output(1,1) = 2/(1+exp(-ramda*net(1,1)))-1;
f = (1-output^2)/2;
new_W = weight + (0.1)*(d-output)*f*input;


input = [1; 5; -3; -7];
weight = [1 0.2 -0.3 -0.5; ...
          4 5 2 3; ...
          -7 -6 4 3];
w = weight(1,:);
sizeW = sqrt(w(1)^2 + w(2)^2 + w(3)^2);
normW = w/sizeW;

weightNorm(1,:) = normW;
net = normW*input;

w = weight(2,:);
sizeW = sqrt(w(1)^2 + w(2)^2 + w(3)^2);
normW = w/sizeW;

weightNorm(2,:) = normW;
net = normW*input;

w = weight(3,:);
sizeW = sqrt(w(1)^2 + w(2)^2 + w(3)^2);
normW = w/sizeW;

weightNorm(3,:) = normW;
net = normW*input;




