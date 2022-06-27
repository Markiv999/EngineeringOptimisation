function [x,lb,ub] = setinitialconditions()
%SETINITIALCONDITIONS Summary of this function goes here
%   Detailed explanation goes here
 Pc=206.429*10^5;
 At=0.26162*0.26162*pi;
 Ae=1.15189*1.15189*pi

 x=[Pc,At,Ae]
 lb=[0,0,0];
 ub=[250,2*At,2*Ae];

end

