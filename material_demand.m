%----------material demand module------------------------------------
%inputs: EV sales by technology --exogenous for now
function [gl_demand,gni_demand,gco_demand,gal_demand,gmn_demand,gcu_demand,ggr_demand,gsi_demand] = material_demand(t,U,S,U0,li,ni,co,al,mn,cu,gr,si)
%this function derives ev sales from ev stock 
%how many of the cars in the stock last year are in the stock this year
%stock last year has to go through a survival function
%FOR NOW ONLY because when EV numbers are rising rapidly
%there are five types of battery
type=5;
typ=4;
evfleet=U;
sales(1:3,1)=U(19:21,1)-U0(19:21,1)*0.95;
salesev0=sum(sales(1:3,1));
for j=1:3
    sales_tech(j,1)=salesev0*S(18+j,1)/(S(19,1)+S(20,1)+S(21,1));
    li_d(j,1)=sales_tech(j,1)*1000*li(j,typ)/0.6;
    ni_d(j,1)=sales_tech(j,1)*1000*ni(j,typ)/0.8;
    co_d(j,1)=sales_tech(j,1)*1000*co(j,typ);
    al_d(j,1)=sales_tech(j,1)*1000*al(j,typ);
    mn_d(j,1)=sales_tech(j,1)*1000*mn(j,typ);
    %copper battery
    cu_d(j,1)=sales_tech(j,1)*1000*cu(j,typ);
    %graphite 
    gr_d(j,1)=sales_tech(j,1)*1000*gr(j,typ);
    %silicon
    si_d(j,1)=sales_tech(j,1)*1000*si(j,typ);
    
end

li_d(isnan(li_d))=0;
ni_d(isnan(ni_d))=0;
co_d(isnan(co_d))=0;
al_d(isnan(al_d))=0;
mn_d(isnan(mn_d))=0;
cu_d(isnan(cu_d))=0;
gr_d(isnan(gr_d))=0;
si_d(isnan(si_d))=0;

gl_demand=sum(li_d,"All");
gni_demand=sum(ni_d,"All");
gco_demand=sum(co_d,"All");
gal_demand=sum(al_d,"All");
gmn_demand=sum(mn_d,"All");
gcu_demand=sum(cu_d,"All");
ggr_demand=sum(gr_d,"All");
gsi_demand=sum(si_d,"All");
%li_demand=permute(li_d(:,:,3),[1 2 3])
%li_demand(isnan(li_demand))=0;
%gl_demand=sum(li_demand,"All")
li_d(isnan(li_d))=0;
ni_d(isnan(ni_d))=0;
co_d(isnan(co_d))=0;
al_d(isnan(al_d))=0;
mn_d(isnan(mn_d))=0;
gr_d(isnan(gr_d))=0;
si_d(isnan(si_d))=0;
