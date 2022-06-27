function [] = Simplex()
%SIMPLEX Summary of this function goes here
%   Detailed explanation goes here

%% Test
test=1;
    if test==1
    Ac=(2.4384/2)*(2.4384/2)*pi;
    Pc=206.429*10^5%Pa
    At=0.26162*0.26162*pi; %m2
    Ae=1.15189*1.15189*pi; %m2
    gamma=1.23;%sp heat ratio
    Pe=1.01*10^5;% perfect expansion at sea level
    end

%% Initiation Of Optimisation Algorithm
[x,lb,ub]=setinitialconditions();


%% Normalization of Variables
[x,lb,ub]=normalize(x,lb,ub);


%% Call Matlab Simplex search Algorithm
options = optimset('Display','iter','PlotFcns',@optimplotfval);

x0 = fmincon(@(x)NozzleWeight(x),x,[],[],[],[],lb,ub,[],options)
Pc=x0(1)
At=x0(2)
Ae=x0(3)
end

