function [Wvolume] = NozzleWeight(Pc,Ae,At,Ac,gamma,Pe,test)
%NOZZLEWEIGHT Calculates Nozzle Weight as a function of expansion ratio,
%thickness and
%   Assumptions: Thin shell theory to estimate the thickness at throat and
%   exit, average taken as nozzle thickness.(Reasonable but only given for conical nozzle)
%   Single material conical nozzle, temperature loads ignored(only somewhat reasonable for heat sink cooled nozzle, biggest assumption)
%   References: Project RAND USAF, TRP Reader TU Delft(Chapter Ideal Rocket Theory, Design of thin shell structures)

%% Section for Debug
test=1;

    if test==1
    Ac=(2.4384/2)*(2.4384/2)*pi;
    Pc=206.429*10^5%Pa
    At=0.26162*0.26162*pi; %m2
    Ae=1.15189*1.15189*pi; %m2
    gamma=1.23;%sp heat ratio
    Pe=1.01*10^5;% perfect expansion at sea level
    
    end
%% Constants for Nozzle
    rho=8193.2518 ; %material density Kg/m3 [Inconel 718]
    f    = 1.5; %Factor of safety
    alpha=25;%Divergent half angle deg
    beta=39.4378;%Convergent half angle deg
    sigma=1.241056e+9;%N/m2 Ultimate stress of material[Inconel 718]
%% IRT Calculations

Pt=Pc*( 2/ (gamma+1) )^( (gamma)/(gamma+1) )

%% Chamber Weight
Rc=sqrt(Ac/pi);
Rt=sqrt(At/pi);
tc=1.5*Pc*Rc/sigma;
%hn1=(Rc-Rt)/tand(beta);
h= 4.2672 - 3.0734;
W_c= rho*(pi*( ( (Rc+tc)^2 ) - (Rc^2) ) * h)

%W_c2= rho*(pi*( ( tc^2 + 2*Rc*tc ) * h))

%% Chameber Weight 2
% Material properties:
% Haynes 188
%rho = 8980;  %kg/m3
%sigma = 748E+06; %Pa

% Chamber pressure:
%p_c = 50E+05;   %Pa

% Chamber radius:
%R_c = 0.265;    %m

% % Chamber length (for cylindrical chamber):
% L_c = 0.97; %m

% Safety factor:
j = 1.5;

% Spherical chamber:
% Chamber volume:
%V_c = 4/3 * pi * R_c^3; %m3
%chamber_mass = 1.5 * rho/sigma * j * p_c * V_c;   %kg

% % Cylindrical chamber:
 V_c = pi * Rc^2 * h; %m3
 chamber_mass = (2/(h/Rc) + 2) * rho/sigma * j * Pc * V_c   %kg

% Injector (assuming circular):
A_c = pi * Rc^2;   %m2   
injector_mass = rho/sigma * j * (1.2 * A_c * Rc * sqrt(Pc*sigma))    %kg
%% Nozzle Weight from Chamber to throat

Rt=sqrt(At/pi);
Rp=Rt/cosd(beta);

tt=(Rp*Pt)/sigma% Throat Thickness m thin shell theory

Rc=sqrt(Ac/pi);
Rp=Rc/cosd(alpha);

tc=(Rc*Pc)/sigma% Chamber Thickness thin shell theory

tavg=f*(tt+tc)/2

%% Weight from Volume and Density
W_n1_volume=(( (1/9)*pi*( (Rc-Rt)/tand(beta) ) ) *( ( 3*tavg*(Rc^2-Rt^2) ) + (3*tavg*(Rc-Rt)) ))*rho;


%%
tavgininch=39.3701*tavg;
At=1550.0031*At;%inch conversion
Ac=1550.0031*Ac;%inch conversion

W_n1= ((Ac-At)*tavgininch) / (sind(beta));% From Project RAND


%% Nozzle Weight from throat to Exit

Re=sqrt(Ae/pi);
Rp=Re/cosd(alpha);

te=(Rp*Pe)/sigma% Exit Thickness thin shell theory

tavg=f*(tt+te)/2;

%% Weight from Volume and Density
W_n2_volume=(( (1/9)*pi*( (Re-Rt)/tand(alpha) ) ) *( ( 3*tavg*(Re^2-Rt^2) ) + (3*tavg*(Re-Rt)) ))*rho;

W_volume=W_n1_volume+W_n2_volume

%%
tavgininch=39.3701*tavg;
Ae=1550.0031*Ae;%inch conversion
W_n2= ((Ae-At)*tavgininch) / (sind(beta));% From Project RAND

%% Final Nozzle Weight

W_n=W_n1+W_n2;%lb

W_n=W_n*0.453592/9.81;%lb to Kg

Wtotal=W_n+W_c;

Wvolume=W_c+W_volume;
end

