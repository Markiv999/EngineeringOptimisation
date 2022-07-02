%% Viking 5 

P_cVi=58;
ExtrashellmassV=826-412.6812;

%% RS25

P_cRs=206.4;
ExtrashellmassPc=3177-497.7145;

y=[ExtrashellmassV,ExtrashellmassPc];
x=[P_cVi,P_cRs];
ws = warning('off','all');  
Nsmass=polyfit(x,y,2);
warning(ws)
% x1 = linspace(50,300);
% y1 = polyval(Nsmass,x1);
% figure
% plot(x,y,'o')
% hold on
% plot(x1,y1)
% 
% hold off

polyval(Nsmass,117);




