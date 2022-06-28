% Script defining constants used for calculations of mass and motor
% performance

% Combustion properties
gamma = 1.2;    % heat capacity ratio
R = 287;    % specific gas constant
T_c = 2000; % flame temperature (K)
P_a = 1E+05;    % atmospheric pressure (bar)
g0 = 9.81;   % acceleration due to gravity (m/s2)
Gamma = sqrt(gamma) * (2/(gamma + 1))^((gamma + 1)/(2*gamma - 2));  % Vandenkerckhove function

% Material properties
% Inconel 718
rho = 8193.2518;    % density (kg/m3)
sigma = 1.241056E+09;   % ultimate strength (N/m2)

% Chamber constants
L_c = 1.1938;   % combustion chamber length (m);

% Nozzle constants
alpha = 25; % divergent half angle (deg)
beta = 39.4378; % convergent half angle (deg)

f = 1.5;    % safety factor