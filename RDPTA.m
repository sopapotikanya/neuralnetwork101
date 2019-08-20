% %data = [x1,x2, ... , xn];
% % data = [10,  2, -5; ...
% %     2 , -5,  5];
% L = [1, -1, -1, 1, -1, -1, 1, 1, 1];
% I = [-1, 1, -1, -1, 1, -1, -1, 1, -1,];
% O = [1, 1, 1, 1, -1, 1, 1, 1, 1];
% H = [1, -1, 1, 1, 1, 1, 1, -1, 1];
% data = [ L', I', O'];
%     
% d = [ 1, -1, -1; ...
%     -1,  1, -1; ...
%     -1, -1,  1];
% c=1;
% % weight_new = [ 1,  0, 1; ...
% %     -2, -1, 3; ...
% %     0,  2, 1];
% weight_new = zeros(size(data,1)+1,size(data,2));
% weight_pul = [];
cycle_error = 0;
for step=1:3
%     i = mod(step,size(data,2));
%     if i==0
%        i=size(data,2); 
%     end
    i = step;
    for j=1:size(data,2)
        weight=weight_new(:,j);
        input = [data(:,i) ;-1];
        net = weight' * input;
        
        % sign function
        if net >= 0
            output = 1;
        else
            output = -1;
        end
        weight_update = (c/2)*(d(j,i) - output);
        weight_new_sub = weight + weight_update*input;
        
        error = (1/2)*((d(j,i) - output)^2);
        cycle_error = error + cycle_error;
        
        net2 = weight_new'*input;
        output2 = sign(net2);
        
        weight_new(:,j) = weight_new_sub;
        weight_pul = cat(1,weight_pul,[step, weight_new_sub',  output2(1,1), output2(2,1), output2(3,1), cycle_error]);
        
    end

end
%     if cycle_error == 0
%         break;
%     end
% test
% net = weight_new'*[H';-1];
% sign(net)