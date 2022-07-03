function chamber_injector_mass = calc_chamber_injector_mass(p_c, dim_c, shape_c, rho, sigma)
    % Safety factor:
    j = 1.5;

    % Calculating chamber mass using thin shell approximation
    if shape_c == "spherical"
        % Chamber dimensions
        R_c = dim_c;    %m
        V_c = 4/3 * pi * R_c^3; %m3

        chamber_mass = 1.5 * rho/sigma * j * p_c * V_c;   %kg

    elseif shape_c == "cylindrical"
        % Chamber dimensions
        R_c = dim_c(1); %m  
        L_c = dim_c(2); %m
        V_c = pi * R_c^2 * L_c; %m3
        
        chamber_mass = (2/(L_c/R_c) + 2) * rho/sigma * j * p_c * V_c;   %kg
        
    end

    % Calculating injector mass (assuming circular):
    A_c = pi * R_c^2;   %m2   
    injector_mass = rho/sigma * j * (1.2 * A_c * R_c * sqrt(p_c*sigma));    %kg

    % Total chamber + injector mass
    chamber_injector_mass = chamber_mass + injector_mass;   %kg
end


