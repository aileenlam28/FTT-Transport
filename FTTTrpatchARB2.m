function FTTTrpatchARB(XX,YY,Q,L)
%---function FTTTrpatchARB(XX,YY,Q,L)
%---Function that patches data from E3MG 
%---Adds appropriate legend using L as cell vector of categories
%---Q is the quantity on the Y label
cla;

if size(YY,2)==12
     Col = [[0 0 0]; [0 0 0]; [0 0 0]; [0 0 0]; [.5 .5 .5]; [0 0 0]; [.75 .75 0]; [0 0 .75]; [0 0 0]; [0 0 0]; [0 .75 0]; [ 0   0  0]]; 
elseif size(YY,2)<=31
    %separate three colours
    Col1 = [[.5 .5 .5]; [.25 .25 .25]; [ 0   0  0]; [.5 .5 .6]; [.25 .25 .5]; [ 0   0  .5]];  %Petrol
    Col2 = [[ 0.84 0 0.84]; [  0.67   0 .67]; [ 0.41   0 .41]; [ 0  0  .8]; [  0   0 .65]; [ 0   0 .4]];  %Diesel
    Col3 = [[ 1  1  0]; [  0.9  0.9  0]; [  0.8  0.8  0]];                                         %CNG
    Col4 = [[ 1  0  0]; [.75   0   0]; [.5   0  0]];                                         %Hybrid
    Col5 = [[ 0.76  0.87  0.78]; [.47   0.67 .19]; [.11  0.31 .21]];                                         %EV
    Col6 = [[0.8500 0.3250 0.0980]; [0.765	0.2925	0.0882]; [0.68 0.26	0.0784]];                     %PHEV
    Col7 = [[0.301	0.745	0.933]; [0.25585	0.63325	0.79305]; [0.19565	0.48425	0.60645]];                     %Hydrogen
    %Col1 = [[.0 .0 .0]; [.0 .0 .0]; [ 0.0   0.0  0.0]; [.0 .0 .0]; [.0 .0 .0]; [ 0.0  0.0  .0]];  %Petrol
    %Col2 = [[ 0.41 0.41 0.41]; [  0.41   0.41 .41]; [ 0.41   0.41 .41]; [ 0.41  0.41  .41]; [  0.41   0.41 .41]; [ 0.41   0.41 .41]];  %Diesel
    %Col3 = [[0.9  0.9  0.9]; [  0.9  0.9  0.9]; [  0.9  0.9  0.9]];                                         %CNG
    %Col4 = [[ 0.6350 0.0780 0.1840]; [0.6350 0.0780 0.1840]; [0.6350 0.0780 0.1840]];                                         %Hybrid
    %Col5 = [[ .47   0.67 .19]; [.47   0.67 .19]; [.47   0.67 .19]];                                         %EV
    %Col6 = [[0.9290 0.6940 0.1250]; [0.9290 0.6940 0.1250]; [0.9290 0.6940 0.1250]];                     %PHEV
    %Col7 = [[0.3010 0.7450 0.9330]; [0.3010 0.7450 0.9330]; [0.3010 0.7450 0.9330]];                     %Hydrogen
    
    Col8 = [[ 0  0.4  0]; [ 0  0.5  0]; [0  0.5  0]; [0  0.5  0]];                             %2W
    Col = [Col1; Col2; Col3; Col4; Col5; Col6;Col7;Col8];
%else
 %   Col = [[0 0 1]; [0 .5 0]; [0 0 0]; [.3 .3 .3]; [.6 .6 .6]; [.8 .8 .8]; [1 .3 1]; [.6 .3 1]; [1 0 0]; [.7 0 0]; [1 .5 .5]; [1 .8 .8]];
  %  Col = [Col; [1 1 0]; [1 1 .4]; [.3 .3 1]; [.6 .6 1]; [0 1 0]; [.3 1 .3]; [1 .8 0]; [1 .6 0]; [.8 .5 .3]; [.3 .5 .8]; [1 0 1]; [1 .5 1]; [0 0 .5]; [0 .2 0]; [.2 0 0]; [.5 .5 0];];
  %  Col = [Col; Col];
end
   
hold on;
patch([[min(XX) max(XX)]' ; XX(end:-1:1)],[[0 0]' ; YY(end:-1:1,1)],Col(1,:));
if size(YY,2) == 31
    Ord = [1 4 2 5 3 6 7 10 8 11 9 12 13 14 15 16 17 18 19 20 21 22 24 23 25 26 27 28 29 30 31];
else
    Ord = 1:size(YY,2);
end
%Reorder YY and Col
YY = YY(:,Ord);
Col = Col(Ord,:);
if size(YY,2) > 1
    for i = 2:size(YY,2)
        if sum(YY(:,1:i)) > sum(sum(YY))/1e9
            patch([XX ; XX(end:-1:1)],[sum(YY(:,1:i-1),2) ; sum(YY(end:-1:1,1:i-1),2)+YY(end:-1:1,i)],Col(mod(i-1,30)+1,:),'edgecolor','none');
        else
            patch([XX ; XX(end:-1:1)],[sum(YY(:,1:i-1),2) ; sum(YY(end:-1:1,1:i-1),2)+YY(end:-1:1,i)+max(max(YY))/1e6],Col(mod(i-1,30)+1,:),'edgecolor','none');
        end
    end
end
hold on;
plot([2019 2019],get(gca,'ylim'),'--','color',[1 1 1],'linewidth',1);
L1990 = sum(interp1N(XX*ones(1,size(YY,2)),YY,1990*ones(1,size(YY,2))));
plot([XX(1) XX(end)],[L1990 L1990],'--','color',[.5 .5 .5],'linewidth',1);
set(gca,'xlim',[min(XX) max(XX)]);
zoom reset;
set(gca,'linewidth',1,'fontweigh','normal','fontsize',10,'box','on');
legend('Petrol Econ','Petrol Mid','Petrol Lux','Petrol Econ adv','Petrol Mid adv','Petrol Lux adv','Diesel Econ','Diesel Mid','Diesel Lux','Diesel Econ adv','Diesel Mid adv','Diesel Lux adv','CNG Econ','CNG Mid','CNG Lux','Hybrid Econ','Hybrid Mid','Hybrid Lux','Electric Econ','Electric Mid','Electric Lux','PHEV Econ','PHEV Mid','PHEV Lux','Hydrogen Econ','Hydrogen Mid','Hydrogen Lux','Bike Econ','Bike Lux','Bike Adv Econ','Bike Adv Lux')
%h = legend(L);
%set(h,'fontsize',6,'fontweigh','normal','location','NorthEastOutside');
%ylabel(Q)
set(gca,'Layer','top');
grid on;
set(gca, 'XColor', '[0 0 0]')
set(gca,'xticklabel',{[]}) 
set(gca,'YTickLabel',get(gca,'YTick')/1000000000000);
hold off;
