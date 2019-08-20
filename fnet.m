function output = fnet(net, ramda)

SIZE = size(net,1);
for i=1:SIZE
    output(i,1) = 2/(1+exp(-ramda*net(i,1)))-1;

end