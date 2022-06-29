pert = 10.^[-15:-1];

[x,lb,ub]=setinitialconditions;

syms P_c A_t A_e

[x,lb,ub] = normalize(x,lb,ub);
for i=1:length(pert)
    x01=[x(1)+pert(i),x(2),x(3)];
   sensP_c(:,i)=(calc_objective(x01)-calc_objective(x))/pert(i);

   x02=[x(1),x(2)+pert(i),x(3)];
   sensP_c(:,i)=(calc_objective(x02)-calc_objective(x))/pert(i);

   x03=[(1),x(2),x(3)+pert(i)];
   sensP_c(:,i)=(calc_objective(x03)-calc_objective(x))/pert(i);
end

subplot