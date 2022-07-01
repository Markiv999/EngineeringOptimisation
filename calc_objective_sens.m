function total_mass = calc_objective_sens(x)
    % Function to calculate the value of the objective function at design
    % point x
    constants;
    
   %x = Denormalize(x);

    P_c = x(1);
    A_t = x(2);
    A_e = x(3);
    % Importing motor constants
    constants;
   
       % Importing motor constants
%%  % IRT calculations
    mass_flow = Gamma * P_c * A_t / sqrt(R * T_c);  % mass flow through the nozzle (kg/s)
    A_c = (mass_flow * R * T_c)/(0.3 * P_c * sqrt(gamma_val*R*T_c));    % area of the chamber (m2)
    R_c = sqrt(A_c / pi);   % chamber radius (m)
    Kloads= 1;%correction for high chamber pressures
    V_c = pi * R_c^2 * L_c; % chamber volume (m3)
    chamber_mass =Kloads * (2/(L_c/R_c) + 2) * rho_val/sigma_val * f * P_c * V_c ;  % chamber mass using thin shell theory (kg)
    injector_mass = rho_val/sigma_val * f * (1.2 * A_c * R_c * sqrt(P_c*sigma_val));   % injector plate mass using thin shell theory (kg)
    
%     nozzle_convergent_mass = (rho/sigma) * f * (A_t * (((A_c/A_t)-1)/sind(beta)) * (P_c*R_c));  % convergent nozzle mass using thin shell theory (kg)
    nozzle_divergent_mass = (rho_val/sigma_val) * f * (A_t * (((A_e/A_t)-1)/sind(alpha_val)) * (P_c*R_c));  % divergent nozzle mass using thin shell theory (kg)

%     total_mass = chamber_mass + injector_mass + nozzle_convergent_mass + nozzle_divergent_mass; % total mass of the motor (kg)
    total_mass = chamber_mass + injector_mass + nozzle_divergent_mass; % total mass of the motor (kg)
end