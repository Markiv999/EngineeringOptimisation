function [g, h] = calc_constraints(x)
    % Function to calculate constraints at design point x

    P_c = x(1);
    A_t = x(2);
    A_e = x(3);
    
    constants; % values of constants used
    
    % Motor perfomance values from IRT simulations
    thrust_ref = 2.357E+06;
    Isp_ref = 445.7119;
    
    mass_flow = Gamma * P_c * A_t / sqrt(R * T_c);  % mass flow through the nozzle (kg/s)
    
    % temp calculation variables
    a = 2 * gamma_val / (gamma_val - 1);
    b = 2 / gamma_val;
    c = (gamma_val - 1) / (gamma_val);


    % Calculating exit pressure
    func = @(P_e) A_e/A_t - Gamma/sqrt(a * (P_e/P_c)^b * (1 - (P_e/P_c)^c));
    P_e = fsolve(func, 1E+05);  % exit pressure of nozzle (Pa)

    u_e = sqrt(a * R * T_c * (1 - (P_e/P_c)^c));    % exit velocity of nozzle (m/s)
    
    thrust = mass_flow * u_e + (P_e - P_a)*A_e; % thrust calculated using IRT (N)
    Isp = thrust / (mass_flow * g0);    % Isp (s)


    g(1) = 1 - Isp/Isp_ref   % Isp constraint
    h(1) = 1 - thrust/thrust_ref% thrust constraint

end