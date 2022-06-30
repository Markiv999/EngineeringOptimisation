function [dwrtP_c,dwrtA_t,dwrtA_e] = calc_derivatives(x)
%CALC_DERIVATIVES Summary of this function goes here
%   Detailed explanation goes here

    P_c = x(1);
    A_t = x(2);
    A_e = x(3);
    




constants;
    % IRT calculations
    mass_flow = Gamma * P_c * A_t / sqrt(R * T_c);  % mass flow through the nozzle (kg/s)
    A_c = (mass_flow * R * T_c)/(0.3 * P_c * sqrt(gamma_val*R*T_c));    % area of the chamber (m2)
    R_c = sqrt(A_c / pi);   % chamber radius (m)
    
    V_c = pi * R_c^2 * L_c; % chamber volume (m3)

dwrtP_c= (2/(L_c/R_c) + 2) * rho_val/sigma_val * f  * V_c + (rho_val/sigma_val) * f * (1.2 * A_c * R_c * (sigma_val/(2*sqrt(P_c*sigma_val)))) + (rho_val/sigma_val) * f * (A_t * (((A_e/A_t)-1)/sind(alpha_val)) * (R_c));

c=sqrt(Gamma/(0.3*pi*sqrt(gamma_val)));
c2=rho_val/sigma_val * f * P_c * pi * L_c;
dmcwrtAt= (3 * c2 *((c^1.5)*(A_t^0.5)/L_c)) + (2*c2*c);
dmiwrtAt= rho_val/sigma_val * f * 1.2 * 1.5 * pi * c^1.5 * A_t^0.5 * sqrt(P_c*sigma_val);
dmnwrtAt= ( ( ( rho_val/sigma_val * f * A_e * P_c * c^0.5 )/(2*sqrt(A_t)) )  - (rho_val/sigma_val * f * P_c * sqrt(c) * 1.5 * sqrt(A_t)) ) / sind(alpha_val);

dwrtA_t= dmcwrtAt +dmiwrtAt + dmnwrtAt;

dwrtA_e= rho_val/sigma_val * f * P_c * R_c /sind(alpha_val);

end

