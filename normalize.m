function [x,lb,ub] = normalize(x,lb,ub)
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here
% Reference Matrix is globalized

global ref

ref= x;

   x=x./ref;
  lb=lb./ref;
  ub=ub./ref;
  
   
end

