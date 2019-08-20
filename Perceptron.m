clear
data = [0.8, 0.5, 0, 1; ...
    0.9, 0.7, 0.3, 1; ...
    1, 0.8, 0.5, 1; ...
    0, 0.2, 0.3, 2; ...
    0.2, 0.1, 1.3, 2; ...
    0.2, 0.7, 0.8, 2];
% c=1;
% weight_new = [1, 0.5, -1]';

weight_new = [0.1 0.2 -0.1 -0.2]';
weight_pul = [];
ramda = 1;
learning_cons = 0.5;
for i=1:size(data,1)
    weight=weight_new;
    input = [data(i,1:3)' ;1];
    if data(i,4) == 1
        d = 1;
    else
        d = -1;
    end
    
    net = weight' * input;
    
    % sign function
%     if net >= 0
%         output = 1;
%     else
%         output = -1;
%     end
%     weight_update = (c/2)*(d - output);
    
    % f net function
    output = 2/(1+exp(-ramda*net)) -1;
    weight_update = (1/2)*learning_cons*(d - output)*(1-(output)^2);
    error = ((d - output)^2)/2;
    weight_new = weight + weight_update*input;
    weight_pul = cat(1,weight_pul,[weight_new', weight_update, net,output, error]);
end
