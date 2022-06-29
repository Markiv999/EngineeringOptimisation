clear all
pert = 10.^[-15:-1];

constants;

[x,lb,ub]=setinitialconditions;

syms P_c A_t A_e;

X_an=[P_c A_t A_e];
%% Analytical Sensitivities
Sens_A_P_c=diff( calc_objective_sens(X_an), P_c)

Sens_A_P_c=subs(Sens_A_P_c,[P_c,A_t,A_e],x)

Sens_A_P_c=double(Sens_A_P_c)



Sens_A_A_t=diff( calc_objective_sens(X_an), A_t)

Sens_A_A_t=subs(Sens_A_P_c,[P_c,A_t,A_e],x)

Sens_A_A_t=double(Sens_A_P_c)



Sens_A_A_e=diff( calc_objective_sens(X_an), A_e)

Sens_A_A_e=subs(Sens_A_P_c,[P_c,A_t,A_e],x)

Sens_A_A_e=double(Sens_A_P_c)




[x,lb,ub] = normalize(x,lb,ub);


for i=1:length(pert)
    x_01=[x(1)+pert(i),x(2),x(3)];
   sensP_c(:,i)=(calc_objective(x_01)-calc_objective(x))/pert(i);

   x_02=[x(1),x(2)+pert(i),x(3)];
   sensP_c(:,i)=(calc_objective(x_02)-calc_objective(x))/pert(i);

   x_03=[(1),x(2),x(3)+pert(i)];
   sensP_c(:,i)=(calc_objective(x_03)-calc_objective(x))/pert(i);
end

subplot