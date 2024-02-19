function [LCOT,dLCOT,TLCOT,dTLCOT,LTLCOT,dLTLCOT] = FTTTrLCOTv3(M,CF,FF,NSeats,VT,FT,RT,OilP,RTCO,Gam,NTT)
% Levelised cost of transport for all technologies, 1 region
% The LCOT value is used to compare the cost of a unit of transport service
% in pkm between technologies. 
% M is the Cost Matrix for one region
% r is the discount rate

%Lifetimes
LF = M(:,8);
LFM = ones(max(LF),1)*M(:,8)';
%Discount rate on a matrix
rM = ones(max(LF),1)*M(:,7)';
%NPV time vectors
t = [0:max(LF)-1]'*ones(1,NTT);
% costs of cars : it is only paid once in a lifetim. 12 is the lifetimes for cars 
It = (ones(max(LF),1)*M(:,1)').*(t < 1);


dIt = (ones(max(LF),1)*M(:,2)').*(t < 1);
% costs of cars : it is only paid once in a lifetim. 12 is the lifetimes for cars 
%RTCOt is reg tax based on carbon price in $/gCO2/km -> RTCOt = ($/tCO2/km)/(tCO2/km)
RTCOt = RTCO.*M(:,14);
%Registration taxes to be added
ItVT = (ones(max(LF),1)*(VT'+RTCOt')).*(t < 1);
% lifetime vector of fuel costs


%Ft = (ones(max(LF),1)*M(:,3)').*(t < LFM);
%dFt = (ones(max(LF),1)*M(:,4)').*(t < LFM);
% lifetime vector of fuel costs incl tax
%FtFT = (ones(max(LF),1)*(M(:,3)'.*(1+FT'))).*(t < LFM);
%O&M cost 



Ft = (ones(max(LF),1)*(M(:,3).*OilP(:,1))').*(t < LFM);
dFt = (ones(max(LF),1)*M(:,4)').*(t < LFM);
% lifetime vector of fuel taxes to be added
FtFT = (ones(max(LF),1)*(M(:,9)'.*FT')).*(t < LFM);
%O&M cost 
OMt = (ones(max(LF),1)*M(:,5)').*(t < LFM);
dOMt = (ones(max(LF),1)*M(:,6)').*(t < LFM);
%capacity factors (constant), not actual CF
%CFt = ones(max(LF),1)*CF';
CFt = ones(max(LF),1)*M(:,12)';
%Filling factors
FFt = ones(max(LF),1)*FF';
%Numbers of seats
NSt = ones(max(LF),1)*NSeats';
%Road Tax
RTt = (ones(max(LF),1)*RT').*(t < LFM);
%DelPrt = (ones(max(LF),1)*DelPr).*(t < LFM);
ItVT = (ones(max(LF),1)*(VT'+RTCOt')).*(t < 1);
%ItDP =(ones(max(LF),1)*(DelPr')).*(t < 1);
%M(:,1)'*DelPr'
%1*31,1*31
%ItDP1=ItDP(12,31)*ones(31,12)*It(12,31);

%for m=1:12
    %for b=1:31
      
      %  ItDP1(m,b)=ItDP(m,b)*It(m,b); 
       % DP1(m,b)=ItDP1(m,b)-It(m,b); 
        
    
    % end
%end
 %DP1=zeros(12,31);
     
%E3ME code:
%                   !All costs in $2012/pkm
%                     !Investment cost is paid upfront
%                     It = BTTC(I,J,1)/NS/FF/CF
%                     dIt = BTTC(I,J,2)/NS/FF/CF
%                     !Vehicle tax at purchase time
%                     VTt = (TTVT(I,J)+RTCO(J)*BTTC(I,J,14))/NS/FF/CF
%                     !Fuel cost
%                     Ft = BTTC(I,J,3)/NS/FF
%                     dFt = BTTC(I,J,4)/NS/FF
%                     !Fuel tax cost
%                     FTt = RTFT(J)*EN/NS/FF*TF(I)
%                     !Operation and maintenance
%                     OMt = BTTC(I,J,5)/NS/FF
%                     dOMt = BTTC(I,J,6)/NS/FF
%                     !Road tax 
%                     RTt = TTRT(I,J)/CF/NS/FF
%   

%LCOT without policy in $/pkm
LCOT = (sum(((It)./NSt./FFt./CFt/1000 + Ft./NSt./FFt + OMt./NSt./FFt)./(1+rM).^t)./sum((t<LFM)./(1+rM).^t))';
 
dLCOT = (sum(sqrt(dIt.^2./(NSt.*FFt.*CFt*1000).^2 + dFt.^2./(NSt.*FFt).^2 + dOMt.^2./(NSt.*FFt).^2)./(1+rM).^t)./sum((t<LFM)./(1+rM).^t))';

%LCOT with policy
%TLCOT = (sum(((It+ItVT+DP1)./NSt./FFt./CFt./1000 + (Ft+FtFT)./NSt./FFt + OMt./NSt./FFt + RTt./NSt./FFt./CFt)./(1+rM).^t)./sum((t<LFM)./(1+rM).^t))';
TLCOT=(sum(((It+ItVT)./NSt./FFt./CFt./1000 + (Ft+FtFT)./NSt./FFt + OMt./NSt./FFt + RTt./NSt./FFt./CFt)./(1+rM).^t)./sum((t<LFM)./(1+rM).^t))';
%+ItDP
%TLCOT=(sum(((It+ItVT)./NSt./FFt./CFt./1000 + (Ft+FtFT)./NSt./FFt + OMt./NSt./FFt + RTt./NSt./FFt./CFt)./(1+rM).^t)./sum((t<LFM)./(1+rM).^t))';

dTLCOT = dLCOT;
LCOT(isnan(LCOT)) = 999999;
dLCOT(isnan(dLCOT)) = 99999;

%With Gamma values
TLCOTG = TLCOT;% + Gam;

%Costs in log space for the cost comparison (see Wikipedia 'Lognormal distribution')
%Includes Gamma values
 LTLCOT = log(TLCOT.^2./sqrt(dTLCOT.^2 + TLCOT.^2))+Gam;
 LTLCOT0 = log(TLCOT.^2./sqrt(dTLCOT.^2 + TLCOT.^2));
 %LTLCOT = log(TLCOT.^2./sqrt(dTLCOT.^2 + TLCOT.^2)) + Gam;
 %US
 

 
      
 
%China
%for tech=1:25
 %   if(mod(tech,3)==1)
         %DelPr(1,tech)
         %permute(DelPr(34,tech,t),[2,1,3]);
  %       LTLCOT(tech,1)= LTLCOT(tech,1)+DelPr(1,tech)';
   % elseif(mod(tech,3)==2)
    %     LTLCOT(tech,1)= LTLCOT(tech,1)+DelPr(1,tech)';
   %end
    
%end

dLTLCOT = sqrt(log(1 + dTLCOT.^2./TLCOT.^2));



      
