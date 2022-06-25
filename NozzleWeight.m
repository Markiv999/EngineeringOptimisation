function [W_n] = NozzleWeight(Pc,Ae,At,Ac,gamma,test)
%NOZZLEWEIGHT Calculates Nozzle Weight as a function of expansion ratio,
%thickness and
%   Assumptions: Thin shell theory to estimate the thickness at throat and
%   exit, average taken as nozzle thickness.(Reasonable but only given for conical nozzle)
%   Single material conical nozzle, temperature loads ignored(only somewhat reasonable for heat sink cooled nozzle, biggest assumption)
%   Reference: Project RAND USAF, TRP Reader TU Delft(Chapter Ideal Rocket Theory, Design of thin shell structures)

%% Section for Debug
test=1;

    if test==1
    Ac=1.5*1.5*pi;
    Pc=50;%Bar
    At=pi; %m2
    Ae=4*pi; %m2
    gamma=1.25;%sp heat ratio
    alpha=12.5;%Divergent half angle deg
    beta=60;%convergent half angle deg
    sigma=1000;%ultimate stress of material
    end

%% IRT Calculations

Pt=Pc*( 2/ (gamma+1) )^( (gamma)/(gamma+1) );

Pe=1;
%% Nozzle Weight from Chamber to throat
Rt=sqrt(At/pi);
Rp=Rt/cosd(alpha);

tt=sigma/(Rp*Pt);% Throat Thickness thin shell theory

Rt=sqrt(Ac/pi);
Rp=Rt/cosd(alpha);

tc=sigma/(Rp*Pc);% Chamber Thickness thin shell theory

tavg=(tt+tc)/2;

W_n1= ((Ac-At)*tavg) / (sind(beta));% From Project RAND

%% Nozzle Weight from throat to Exit


Rt=sqrt(Ae/pi);
Rp=Rt/cosd(alpha);

te=sigma/(Rp*Pe);% Exit Thickness thin shell theory

tavg=(tt+te)/2;

W_n2= ((Ae-At)*tavg) / (sind(beta));% From Project RAND

%% Final Nozzle Weight
W_n=W_n1+W_n2
end

