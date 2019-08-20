clear
% input
X(:,1) = [1, 1, -1]'; 
X(:,2) = [6, 1, -1]'; 
X(:,3) = [5, 5, -1]'; 
X(:,4) = [3, 1, -1]'; 
X(:,5) = [5, 6, -1]'; 
X(:,6) = [-5, -5, -1]'; 
% desiger
D(:,1) = [1, -1, -1]';
D(:,2) = [1, -1, -1]';
D(:,3) = [-1, 1, -1]';
D(:,4) = [-1, 1, -1]';
D(:,5) = [-1, -1, 1]';
D(:,6) = [-1, -1, 1]';

Z = cat(1,X,-1*ones(1,size(X,2)));


I = size(Z,1);
J = 3;
K = 3;
ramda = 1;
init_v = ones(J,I);
init_w = ones(K,J);

V = init_v;
W = init_w;


E = 0;
for p=1:size(X,2)
%     z = Z(:,p);
    d = D(:,p);
    z = [0.25; 0.25; -1];
    
    net_Vz = V*z;
    y = fnet(net_Vz,ramda);
    net_Wy = W*y;
    o = fnet(net_Wy,ramda);

    E = E + (1/2)*((norm(d-o))^2);
    for k=1:3
        delta_o(k,1) = (d(k) - o(k)).*fnet_dash(o(k));
    end

    for j=1:3
        delta_y(j,1) = sum(delta_o.*W(:,j))*fnet_dash(y(j));
    end

    W = W + (0.5)*delta_o*y';
    V = V + (0.5)*delta_y*z';
end