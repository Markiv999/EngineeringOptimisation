function [] = Simplex()
%SIMPLEX Summary of this function goes here
%   Detailed explanation goes here

%% Test


%% Initiation Of Optimisation Algorithm
[x,lb,ub]=setinitialconditions();


%% Normalization of Variables
[x,lb,ub]=normalize(x,lb,ub);


%% Call Matlab Simplex search Algorithm
options = optimset('Display','iter-detailed','PlotFcns',@optimplotfval,'PlotFcns',@optimplotconstrviolation);

[x0,fval] = fmincon(@(x)calc_objective(x),x,[],[],[],[],lb,ub,@(x)calc_constraints(x),options)

global ref
P_c=x0(1)*ref(1)
A_t=x0(2)*ref(2)
A_e=x0(3)*ref(3)
fval
end

