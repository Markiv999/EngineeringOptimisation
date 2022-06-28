function [g, h] = calc_constraints(x)
    % Function to calculate constraints at design point x

    P_c = x(1);
    A_t = x(2);
    A_e = x(3);
    
    constants; % values of constants used
    
    % Motor perfomance values
    F = 1000E+03;
    Isp = 300;


    
    mass_flow = Gamma * P_c * A_t / sqrt(R * T_c);  % mass flow through the nozzle (kg/s)
    
    % temp calculation variables
    a = 2 * gamma / (gamma - 1);
    b = 2 / gamma;
    c = (gamma - 1) / (gamma);


    % Calculating exit pressure
    func = @(P_e) A_e/A_t - Gamma/(a * (P_e/P_c)^b * (1 - (P_e/P_c)^c));
    P_e = fsolve(func, 1E+05);  % exit pressure of nozzle (Pa)

    u_e = sqrt(a * R * T_c * (1 - (P_e/P_c)^c));    % exit velocity of nozzle (m/s)

    g(1) = 1 - (u_e/g + (P_e - P_a)*A_e/(mass_flow*g))/Isp;    % Isp constraint

    h(1) = 1 - (mass_flow * u_e + (P_e - P_a) * A_e)/F; % thrust constraint

    
end