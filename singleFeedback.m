clear
% s1 = [1 1 1 1 1]';
% s2 = [1 -1 -1 1 -1]';
% s3 = [-1 1 1 1 1]';
s1 = [-1 -1 1 1]';
s2 = [-1 1 1 -1]';


% S = cat(2,s1, s2, s3);

% W = s1*s1' + s2*s2' + s3*s3' - 3*eye(5);
% W = s1*s1' + s2*s2' - 2*eye(4);
% 
% W = [ 0, 1, 1,-1, 1; ...
%       1, 0,-1,-3, 3; ...
%       1,-1, 0, 1,-1; ...
%      -1,-3, 1, 0,-3;...
%       1, 3,-1,-3, 0];
  
% v0 = [-1;-1; 1; 1; 1];
% v0 = [-1;-1; 1; 1; -1];
% v0 = [-1;-1; -1; 1; -1];
% v0 = [-1;1; -1; 1; -1];
% v0 = [1;-1; 1; 1; -1];
% v0 = [1;-1;-1; 1; 1];
v0 = [-1 1 -1 1]';
v_init = v0;
v_final = v_init;
u = 0;

for i=1:10%[5,4,3,2,1]
    
    v_init = v_final;
    net = W'*v_init;
    o = sgn(net);
%     v_final(i,1) = o(i,1);
    v_final = o;
    
    u=u+1;
    E(u) = -(1/2)*v_final'*W*v_final;
end

