function [x,lb,ub] = setinitialconditions()
%SETINITIALCONDITIONS Summary of this function goes here
%   Detailed explanation goes here
Pc = 206.429E+05;  % chamber pressure (Pa)
At = 0.0602;   % throat area (m2)
Ae = 4.1548;   % exit area (m2)
 x=[Pc,At,Ae];
 lb=[0.25*Pc,0.25*At,0.25*Ae];
 ub=[2.5*Pc,2.5*At,2.5*Ae];

end

