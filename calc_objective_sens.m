function total_mass = calc_objective_sens(x)
    % Function to calculate the value of the objective function at design
    % point x
    
    P_c = x(1);
    A_t = x(2);
    A_e = x(3);
%%
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

f = 1.5;    % safety factor  % values of constants used
%%

    % IRT calculations
    mass_flow = Gamma * P_c * A_t / sqrt(R * T_c);  % mass flow through the nozzle (kg/s)
    A_c = (mass_flow * R * T_c)/(0.3 * P_c * sqrt(gamma*R*T_c));    % area of the chamber (m2)
    R_c = sqrt(A_c / pi);   % chamber radius (m)
    
    V_c = pi * R_c^2 * L_c; % chamber volume (m3)
    chamber_mass = (2/(L_c/R_c) + 2) * rho/sigma * f * P_c * V_c ;  % chamber mass using thin shell theory (kg)
    injector_mass = rho/sigma * f * (1.2 * A_c * R_c * sqrt(P_c*sigma));    % injector plate mass using thin shell theory (kg)
    
   % Included in Shell Mass nozzle_convergent_mass = (rho/sigma) * f * (A_t * (((A_c/A_t)-1)/sind(beta)) * (P_c*R_c));  % convergent nozzle mass using thin shell theory (kg)
   
   nozzle_divergent_mass = (rho/sigma) * f * (A_t * (((A_e/A_t)-1)/sind(alpha)) * (P_c*R_c));  % divergent nozzle mass using thin shell theory (kg)

    total_mass = chamber_mass + injector_mass + nozzle_divergent_mass; % total mass of the motor (kg)
end
