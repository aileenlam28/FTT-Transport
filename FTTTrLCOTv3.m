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
%Includes Gamma values
 LTLCOT = log(TLCOT.^2./sqrt(dTLCOT.^2 + TLCOT.^2))+Gam;
 LTLCOT0 = log(TLCOT.^2./sqrt(dTLCOT.^2 + TLCOT.^2)); 
dLTLCOT = sqrt(log(1 + dTLCOT.^2./TLCOT.^2));



      
