function [W_n] = NozzleWeight(Pc,Ae,At,Ac,gamma,test)
%NOZZLEWEIGHT Calculates Nozzle Weight as a function of expansion ratio,
%thickness and
%   Assumptions: Thin shell theory to estimate the thickness at throat and
%   exit, average taken as nozzle thickness.(Reasonable but only given for conical nozzle)
%   Single material conical nozzle, temperature loads ignored(only somewhat reasonable for heat sink cooled nozzle, biggest assumption)
%   References: Project RAND USAF, TRP Reader TU Delft(Chapter Ideal Rocket Theory, Design of thin shell structures)

%% Section for Debug
test=1;

    if test==1
    Ac=1.5*1.5*pi;
    Pc=50*10^5;%Pa
    At=pi; %m2
    Ae=4*pi; %m2
    gamma=1.23;%sp heat ratio
   
    end
%% Constants for Nozzle
    f    = 1.5; %Factor of safety
    alpha=12.5;%Divergent half angle deg
    beta=60;%Convergent half angle deg
    sigma=600*1000*1000;%N/m2 Ultimate stress of material[steel here]
%% IRT Calculations

Pt=Pc*( 2/ (gamma+1) )^( (gamma)/(gamma+1) );

Pe=1;
%% Nozzle Weight from Chamber to throat

Rt=sqrt(At/pi);
Rp=Rt/cosd(alpha);

tt=(Rp*Pt)/sigma;% Throat Thickness m thin shell theory

Rt=sqrt(Ac/pi);
Rp=Rt/cosd(alpha);

tc=(Rp*Pc)/sigma;% Chamber Thickness thin shell theory

tavg=f*(tt+tc)/2

tavgininch=39.3701*tavg;
At=1550.0031*At;%inch conversion
Ac=1550.0031*Ac;%inch conversion

W_n1= ((Ac-At)*tavgininch) / (sind(beta));% From Project RAND

%% Nozzle Weight from throat to Exit

Rt=sqrt(Ae/pi);
Rp=Rt/cosd(alpha);

te=(Rp*Pe)/sigma;% Exit Thickness thin shell theory

tavg=f*(tt+te)/2

tavgininch=39.3701*tavg;
Ae=1550.0031*Ae;%inch conversion
W_n2= ((Ae-At)*tavgininch) / (sind(beta));% From Project RAND

%% Final Nozzle Weight

W_n=W_n1+W_n2;%lb

W_n=W_n*0.453592;%lb to Kg

end

