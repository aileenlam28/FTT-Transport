function [Pr,Prn,Prc,Prm,Pra,Prcu,Prsi,Prgr] = material_price(LId,NId,COd,ALd,MNd,ni_d,co_d,mn_d,al_d,cu_d,gr_d,si_d,min_pm)
                           
%Material price module
%Input: material demand 
%output material price 

%Lithium demand baseline

%C1
m=4;
s=5;
l=5;
C1=min_pm(13,s);
C2=min_pm(12,s);
yl=C1+C2*LId;
%Nickel demand 
C3=min_pm(3,s);
C4=min_pm(2,s);
yn=C3+C4*(NId+ni_d*1000);
%Cobalt demand 
C5=min_pm(8,s);
C6=min_pm(7,s);
yc=C5+C6*(COd+co_d*1000);
%Maganese
C10=min_pm(18,s); 
C11=min_pm(17,s);
ym=C10+C11*(mn_d)/1000;
%aluminium
C8=min_pm(38,s); 
C9=min_pm(37,s); 
ya=C8+C9*(al_d);
%copper 
C13=min_pm(23,s); 
C14=min_pm(22,s); 
%ym=C10+C11*(MNd+mn_d)/1000;
ycu=C13+C14*(cu_d);

%graphite
C15=min_pm(28,s); 
C16=min_pm(27,s); 
ygr=C15+C16*(gr_d);

%silicon 
C17=min_pm(33,s); 
C18=min_pm(32,s); 
ysi=C17+C18*(si_d);

y1l=exp(yl)+1;
Y3=1/(y1l);
Pr=(Y3+(min_pm(11,1)/min_pm(11,s)))*min_pm(11,s);

%nickel has a basic (baseline) demand used by different sectors 
%base_demand=

y1n=exp(yn)+1;
Y3n=1/(y1n);
Prn=(Y3n+(min_pm(1,1)/min_pm(1,s)))*min_pm(1,s);

%cabalt
y1c=exp(yc)+1;
Y3c=1/(y1c);
Prc=(Y3c+(min_pm(6,1)/min_pm(6,s)))*min_pm(6,s);

%maganese
y1m=exp(ym)+1;
Y3m=1/(y1m);
Prm=(Y3m+(min_pm(16,1)/min_pm(16,s)))*min_pm(16,s);

%copper
y1cu=exp(ycu)+1;
Y3cu=1/(y1cu);
Prcu=(Y3cu+(min_pm(21,1)/min_pm(21,s)))*min_pm(21,s);

%graphite
y1gr=exp(ygr)+1;
Y3gr=1/(y1gr);
Prgr=(Y3gr+(min_pm(26,1)/min_pm(26,s)))*min_pm(26,s);

%silicon
y1si=exp(ysi)+1;
Y3si=1/(y1si);
Prsi=(Y3si+(min_pm(31,1)/min_pm(31,s)))*min_pm(31,s);

%aluminium 
y1a=exp(ya)+1;
Y3a=1/(y1a);
Pra=(Y3a+(min_pm(36,1)/min_pm(36,s)))*min_pm(36,s);


