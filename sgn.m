function o = sgn(net)

for i=1:size(net,1)
    if net(i,1) >=0
        o(i,1) = 1;
    else
        o(i,1) = -1;
    end
        
end