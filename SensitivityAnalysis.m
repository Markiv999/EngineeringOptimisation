clear all
close all
clc
pert = 10.^[-15:-1];


constants;
[xsca,lb,ub]=setinitialconditions;

syms P_c A_t A_e;

X_an=[P_c A_t A_e];


xsca=scale(xsca, x_ref);

Sens_A_P_c=diff(calc_objective_sens1(X_an), P_c)

Sens_A_P_c=subs(Sens_A_P_c,[P_c,A_t,A_e],xsca)

Sens_A_P_c=vpa(Sens_A_P_c)



Sens_A_A_t=diff( calc_objective_sens1(X_an), A_t)

Sens_A_A_t=subs(Sens_A_A_t,[P_c,A_t,A_e],xsca)

Sens_A_A_t=vpa(Sens_A_A_t)



Sens_A_A_e=diff( calc_objective_sens1(X_an), A_e)

Sens_A_A_e=subs(Sens_A_A_e,[P_c,A_t,A_e],xsca)

Sens_A_A_e=vpa(Sens_A_A_e)


%% Analytical Sensitivities
constants;
%[SensPC2,SensAt2,SensAe2]= calc_derivatives(x)

  xsca=scale(xsca, x_ref);
  



for i=1:length(pert)
    x_01=[xsca(1)+pert(i),xsca(2),xsca(3)];
   sensP_c_fw(:,i)=(calc_objective_sens(x_01)-calc_objective_sens(xsca))/pert(i);

   x_02=[xsca(1),xsca(2)+pert(i),xsca(3)];
   sensA_t_fw(:,i)=(calc_objective_sens(x_02)-calc_objective_sens(xsca))/pert(i);

   x_03=[(1),xsca(2),xsca(3)+pert(i)];
   sensA_e_fw(:,i)=(calc_objective_sens(x_03)-calc_objective_sens(xsca))/pert(i);


    x_01=[xsca(1)+pert(i),xsca(2),xsca(3)];
    x_10=[xsca(1)-pert(i),xsca(2),xsca(3)];
   sensP_c_cf(:,i)=(calc_objective_sens(x_01)-calc_objective_sens(x_10))/(2*pert(i));

     x_02=[xsca(1),xsca(2)+pert(i),xsca(3)];
     x_20=[xsca(1),xsca(2)-pert(i),xsca(3)];
   
   sensA_t_cf(:,i)=(calc_objective_sens(x_02)-calc_objective_sens(x_20))/(2*pert(i));


     x_03=[xsca(1),xsca(2),xsca(3)+pert(i)];
     x_30=[xsca(1),xsca(2),xsca(3)-pert(i)];
   sensA_e_cf(:,i)=(calc_objective_sens(x_03)-calc_objective_sens(x_30))/(2*pert(i));

end

%% Plot
% plot the results
% P_c sensitivity:
figure('color','w')
semilogx(pert, 100*(sensP_c_fw(1,:)-Sens_A_P_c)/Sens_A_P_c,'ro--');
hold on
semilogx(pert, 100*(sensP_c_cf(1,:)-Sens_A_P_c)/Sens_A_P_c,'b*--');
% some additional lines
semilogx(pert, zeros(size(pert)),'k--');
semilogx(pert, ones(size(pert)),'k--');
semilogx(pert, -ones(size(pert)),'k--');

title(['Relative error of GFD sensitivities[P_c]']);
xlabel('Relative design perturbation');
ylabel('Error [%] in d(fun)/d(P_c)')
legend('Forward FD','Central FD');

set(gca,'ylim',[-5 5]);

% A_t sensitivity:
figure('color','w')
semilogx(pert, 100*(sensA_t_fw(1,:)-Sens_A_A_t)/Sens_A_A_t,'ro--');
hold on
semilogx(pert, 100*(sensA_t_cf(1,:)-Sens_A_A_t)/Sens_A_A_t,'b*--');
% some additional lines
semilogx(pert, zeros(size(pert)),'k--');
semilogx(pert, ones(size(pert)),'k--');
semilogx(pert, -ones(size(pert)),'k--');

title(['Relative error of GFD sensitivities[A_t]']);
xlabel('Relative design perturbation');
ylabel('Error [%] in d(fun)/d(A_t)')
legend('Forward FD','Central FD');

set(gca,'ylim',[-5 5]);


% A_e sensitivity:
figure('color','w')
semilogx(pert, 100*(sensA_e_fw(1,:)-Sens_A_A_e)/Sens_A_A_e,'ro--');
hold on
semilogx(pert, 100*(sensA_e_cf(1,:)-Sens_A_A_e)/Sens_A_A_e,'b*--');
% some additional lines
semilogx(pert, zeros(size(pert)),'k--');
semilogx(pert, ones(size(pert)),'k--');
semilogx(pert, -ones(size(pert)),'k--');

title(['Relative error of GFD sensitivities[A_e]']);
xlabel('Relative design perturbation');
ylabel('Error [%] in d(fun)/d(A_e)')
legend('Forward FD','Central FD');

set(gca,'ylim',[-5 5]);
