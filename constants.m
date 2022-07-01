% Script defining constants used for calculations of mass and motor
% performance

% Combustion properties
gamma_val = 1.2096;    % heat capacity ratio
R = 418;    % specific gas constant
T_c = 2964; % flame temperature (K)
P_a = 0.211E+05;    % atmospheric pressure (bar)
g0 = 9.81 ;   % acceleration due to gravity (m/s2)
Gamma = sqrt(gamma_val) * (2/(gamma_val + 1))^((gamma_val + 1)/(2*gamma_val - 2));  % Vandenkerckhove function

% Material properties
% Haynes 188
rho_val =  8980;    % density (kg/m3)
sigma_val = 748E+06;   % ultimate strength (N/m2)

% Chamber constants
L_c = 1.30;   % combustion chamber length (m);

% Nozzle constants
alpha_val = 11.7; % divergent half angle (deg)  atand( (R_e - Rt)/L )
%beta = 40; % convergent half angle (deg)

f = 1.5;    % safety factor

% Reference motor values
P_c_ref = 58E+05;  % chamber pressure (Pa)
A_t_ref = 0.1886;   % throat area (m2)
A_e_ref = 0.7698;   % exit area (m2)
x_ref = [P_c_ref, A_t_ref, A_e_ref];