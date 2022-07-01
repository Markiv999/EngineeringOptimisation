function [x,lb,ub] = setinitialconditions()
%SETINITIALCONDITIONS Summary of this function goes here
%   Detailed explanation goes here
P_c = 58E+05;  % chamber pressure (Pa)
A_t = 0.1886;   % throat area (m2)
A_e= 0.7698;   % exit area (m2)
 x=[P_c,A_t,A_e];
 lb=[0,0.25*A_t,0.25*A_e];
 ub=[200E+05,2.5*A_t,2.5*A_e];

end

