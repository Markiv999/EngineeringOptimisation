% Script defining constants used for calculations of mass and motor
% performance

% Combustion properties
gamma_val = 1.1692;    % heat capacity ratio
R = 610;    % specific gas constant
T_c = 3598; % flame temperature (K)
P_a = 0.211E+05;    % atmospheric pressure (bar)
g0 = 9.81;   % acceleration due to gravity (m/s2)
Gamma = sqrt(gamma_val) * (2/(gamma_val + 1))^((gamma_val + 1)/(2*gamma_val - 2));  % Vandenkerckhove function

% Material properties
% Inconel 718
rho_val = 8193.2518;    % density (kg/m3)
sigma_val = 1.241056E+09;   % ultimate strength (N/m2)

% Chamber constants
L_c = 1.1938;   % combustion chamber length (m);

% Nozzle constants
alpha_val = 25; % divergent half angle (deg)
beta = 39.4378; % convergent half angle (deg)

f = 1.5;    % safety factor