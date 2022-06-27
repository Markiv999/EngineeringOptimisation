function [Pc,Ae,At] = Denormalize(x)
%DENORMALIZE Summary of this function goes here
%   Detailed explanation goes here
global ref
ref
x=ref.*x;
Pc=x(1);
At=x(2);
Ae=x(3);
end

