function[batp,CAMp]=Material_battery(Pr,Prn,Prc,Prm,Pra,Prgr,Prsi,Prcu,rawp,rawcon,metalp,batc)
%Cell module 
%Calculte cathode cost based on material costs
%NMC-811 battery
%Translate CellEst Cathode Cost Calculation 
%raw material use Lithium (g/cell) - this depends on cell
%Here are the sequence: NCA tesla, NCA, NMC-111, NMC-442, NNMC-532,
%NMC-622, NMC-811, LMO, LMNO, LR, NMC, LFP

%----------from material price to battery price------------------------------
%From raw material cost to metal cost 
%Source: CellEst Model Material Cost
%replace lithium prices in the table by the metal prices calculated in the
%model 
rawp(1,1)=Pr;
rawp(2,1)=Pr;
rawp(4,1)=Prn*0.223/1000;
rawp(3,1)=Prc*0.20965;
rawp(5,1)=Prm*0.325/1000; %Manganese demand check
rawp(6,1)=Pra*0.0907943; %Check why the values are so large
ord=[4 3 2 1 5 9 1 1 6];
for i=1:7
    %calculates lithium prices
    %raw_percent(i,1) is the material price - here is where should be
    %connected to the material price. 
    rawpr(i,1)=rawp(i,1)/rawcon(i,1);
end
%Multiply the cst
CAMp= metalp(1:9,1:5)*rawpr(2:6,1);

%Anode material cost, from cellest model
Pr_an=Prgr*0.95/0.95+Prsi*0;
%mass volume per stack 
Pr_anode=0.012*Pr_an*1000/1.2; 
%Anode for copper, 1.75 being the adjustment factor collected from BatPac
Pr_anode_c=0.04*Prcu*1.75;


for i=1:9
  %batp2(i,1)=((CAMp(i,1)*batc(2,(ord(1,i)+1))/1000+sum(batc(4:26,i+1)))*batc(44,2)+sum(batc(48:54,i+1))*batc(45,i+1)+sum(batc(69:70,i+1))+sum(batc(74:89,i+1)))/batc(91,i+1);
  %batp(i,1)=((CAMp(i,1)*batc(2,(ord(1,i)+1))/1000+sum(batc(4:26,i+1))-batc(9,2)+248*Pr_anode/1000)*batc(44,2)+sum(batc(48:54,i+1))*batc(45,i+1)+sum(batc(69:70,i+1))+sum(batc(74:89,i+1)))/batc(91,i+1);
  batp(i,1)=((CAMp(i,1)*batc(2,(ord(1,i)+1))/1000+sum(batc(4:26,i+1))-batc(9,2)+248*Pr_anode/1000-batc(21,2)+Pr_anode_c)*batc(44,2)+sum(batc(48:54,i+1))*batc(45,i+1)+sum(batc(69:70,i+1))+sum(batc(74:89,i+1)))/batc(91,i+1);
end
rawp(2,1)=Pr;

