function [x,lb,ub] = setinitialconditions()
%SETINITIALCONDITIONS Summary of this function goes here
%   Detailed explanation goes here
 Pc=206.429*10^5;

 Ae=((2.3^2)/4)*pi
   At=Ae/69;
 x=[Pc,At,Ae];
 lb=[0,0,0];
 ub=[250*10^5,2*At,2*Ae];

end

