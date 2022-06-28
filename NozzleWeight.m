function [total_mass] = NozzleWeight(x)
%NOZZLEWEIGHT Calculates Nozzle Weight as a function of expansion ratio,
%thickness and
%   Assumptions: Thin shell theory to estimate the thickness at throat and
%   exit, average taken as nozzle thickness.(Reasonable but only given for conical nozzle)
%   Single material conical nozzle, temperature loads ignored(only somewhat reasonable for heat sink cooled nozzle, biggest assumption)
%   References: TRP Reader TU Delft(Chapter Ideal Rocket Theory, Design of thin shell structures)
%%  Denormalize the Variables
%[P_c,A_e,A_t]=Denormalize(x);

%% Section for Debug

test=1;

    if test==1
    
    P_c=206.429*10^5%Pa
    A_t=0.26162*0.26162*pi; %m2
    A_e=1.15189*1.15189*pi; %m2
   
    end

%% Constants for Nozzle
    P_e=1.01*10^5;% perfect expansion at sea level
   % A_c=0.33*(2.4384/2)*(2.4384/2)*pi;
    A_c=0.59*0.59*pi;
    gamma=1.23;%Specific Heat Ratio
    rho=8193.2518 ; %material density Kg/m3 [Inconel 718]
    j    = 1.5; %Factor of safety
    alpha=25;%Divergent half angle deg
    beta=39.4378;%Convergent half angle deg
    sigma=1.241056e+9;%N/m2 Ultimate stress of material[Inconel 718]
%% IRT Calculations
Van=sqrt(gamma) * ( 2 / (gamma+1) )^( (gamma+1)/(2*(gamma-1))  );


func= @(ynot) (A_e/A_t)- (Van / (sqrt( (2*gamma/(gamma-1)) * ((ynot/P_c)^(2/gamma)) * ((1-(ynot/P_c))^( (gamma-1)/gamma) ) ))) ; 
ynot=1*10^5;
P_e=fsolve(func,ynot);

P_t=P_c*( 2/ (gamma+1) )^( (gamma)/(gamma+1) );

%% Chamber Weight

R_c=sqrt(A_c/pi);
R_t=sqrt(A_t/pi);
t_c=1.5*P_c*R_c/sigma;
%Length of Chamber
L_c= 4.2672 - 3.0734;

%% Chameber Weight(including convergent section of nozzle)

% Spherical chamber:
% Chamber volume:
%V_c = 4/3 * pi * R_c^3; %m3
%chamber_mass = 1.5 * rho/sigma * j * p_c * V_c;   %kg

% % Cylindrical chamber:
 V_c = pi * R_c^2 * L_c; %m3
 chamber_mass = (2/(L_c/R_c) + 2) * rho/sigma * j * P_c * V_c ;  %kg

% Injector (assuming circular):
A_c = pi * R_c^2;   %m2   
injector_mass = rho/sigma * j * (1.2 * A_c * R_c * sqrt(P_c*sigma));    %kg


%% Nozzle Weight (Divergent Section)
nozzle_mass=  (rho/sigma) * j * (A_t * (((A_e/A_t)-1)/sind(alpha)) * (P_c*R_c) ) ;

%% Total Mass
total_mass= chamber_mass+injector_mass+nozzle_mass;
end

