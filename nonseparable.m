
X1 = [3 1 1]';
X2 = [4 0 1]';
X3 = [4 -1 1]';
X4 = [5 2 1]';
X5 = [5 3 1]';
X6 = [3 3 1]';
X7 = [2 0 1]';
X8 = [1 1 1]';

w1 = [2 1 -5]';
w2 = [0 1 -2]';

% w1 = [0 -1 1.5]';
% w2 = [1 0 -2.5]';
i=0;
for input = [X1 X2 X3 X4 X5 X6 X7 X8]
i=i+1;
o(i,1) = sign(w1'*input);
o(i,2) = sign(w2'*input);

end

