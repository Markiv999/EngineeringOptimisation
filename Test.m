%% SUP BRUH

clear all 
close all
clc
%% Test

constants;
%% Initiation Of Optimisation Algorithm
[x,lb,ub]=setinitialconditions();

% %% Normalization of Variables
 x=scale(x, x_ref);
 lb= lb./x_ref;
 ub= ub./x_ref;
calc_objective2(x)


%% Call Matlab Simplex search Algorithm
options = optimoptions('fmincon','Display','iter','Algorithm','sqp','plotfcns',@optimplotfval);
A = []; 
b = [];
Aeq = [];
beq = [];
tic
[xout1, fval1, exitflag1, output1, lambda1] = fmincon(@calc_objective2,x,A,b,Aeq,beq,lb,ub,@calc_constraints,options);
toc
x=output1.bestfeasible.x
x=descale(x,x_ref)
Givemass(x)

tic
%% 
[xout2, fval2, exitflag2, output2, lambda2] = ga(@calc_objective2,3,A,b,Aeq,beq,lb,ub,@calc_constraints);
toc