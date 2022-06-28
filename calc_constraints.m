function [g, h] = calc_constraints(x)

    P_c = x(1);
    A_t = x(2);
    A_e = x(3);
    
    constants;

    F = 1000E+03;
    I_sp = 300;



    mass_flow = Gamma * P_c * A_t / sqrt(R * T_c);
    
    a = 2 * gamma / (gamma - 1);
    b = 2 / gamma;
    c = (gamma - 1) / (gamma);



    func = @(P_e) A_e/A_t - Gamma/(a * (P_e/P_c)^b * (1 - (P_e/P_c)^c));

    P_e = fsolve(func, 1E+05);

    u_e = sqrt(a * R * T_c * (1 - (P_e/P_c)^c));

    g(1) = 1 - (u_e/g + (P_e - P_a)*A_e/(mass_flow*g))/I_sp;

    h(1) = 1 - (mass_flow * u_e + (P_e - P_a) * A_e)/F;

    
end