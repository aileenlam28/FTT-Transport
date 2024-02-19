function FTTTrpatchARB(X,Y,Q,L)
%---function FTTTrpatchARB(XX,YY,Q,L)
%---Function that patches data from E3MG 
%---Adds appropriate legend using L as cell vector of categories
%---Q is the quantity on the Y label

if size(Y,2) == 25
    Col = [[.25 .25 .25]; [.25 .25 .45]; [  0   0 .75]; [.25   0 .75]; [  1 .75   0]; [.75   0   0]; [.75   0 .75]; [  0  .5   0]; [.1 .5  0]];
    v1 = [1 2 3 4 5 6 7 8 9]';
    v2 = [1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 6 6 6 7 7 7 8 8 9 9];
else
    Col = [[0 0 1]; [0 .5 0]; [0 0 0]; [.3 .3 .3]; [.6 .6 .6]; [.8 .8 .8]; [1 .3 1]; [.6 .3 1]; [1 0 0]; [.7 0 0]; [1 .5 .5]; [1 .8 .8]];
    Col = [Col; [1 1 0]; [1 1 .4]; [.3 .3 1]; [.6 .6 1]; [0 1 0]; [.3 1 .3]; [1 .8 0]; [1 .6 0]; [.8 .5 .3]; [.3 .5 .8]; [1 0 1]; [1 .5 1]; [0 0 .5]; [0 .2 0]; [.2 0 0]; [.5 .5 0];];
    v1 = [1 2 3 4 5 6];
    v0 = [{ones(1,33)} {[34 36 44]} {[44 45 46 47]} {[39 40 42 50]} {[35 41 48 49 51 37 38]} {[52 53]}];
    v2 = ones(1,53); for i = 1:length(v0); v1(v0{i}) = i; end;
end
%Transfer matrix:
%Build transfer matrix
for i = 1:length(v1)
    for j = 1:length(v2)
        M(i,j) = (v1(i)==v2(j));
    end
end

%M = v1*v2; %25 horizontal, 9 vertical
%Takes a 25 vertical vector, transforms into a 9 vertical aggregate vector
NnonNaN = size(Y,1)-max(sum(isnan(Y)));
XX = X(1:NnonNaN,:);
YY = Y(1:NnonNaN,:);

for t = 1:size(YY,1)
    if size(XX,2)>1
        XAgg(t,:) = M*XX(t,:)';
    else
        XAgg(t) = XX(t);
    end
    YAgg(t,:) = M*YY(t,:)';
end
if size(XAgg,1)<size(XAgg,2) 
    XAgg = XAgg';
end
cla;
hold on;
patch([[min(XAgg) max(XAgg)]' ; XAgg(end:-1:1)],[[0 0]' ; YAgg(end:-1:1,1)],Col(1,:));
if size(YAgg,2) > 1
    for i = 2:size(YAgg,2)
        if sum(YAgg(:,i)) > sum(sum(YAgg))/1e9
            patch([XAgg ; XAgg(end:-1:1)],[sum(YAgg(:,1:i-1),2) ; sum(YAgg(end:-1:1,1:i-1),2)+YAgg(end:-1:1,i)],Col(mod(i-1,24)+1,:),'edgecolor','none');
        else
            patch([XAgg ; XAgg(end:-1:1)],[sum(YAgg(:,1:i-1),2) ; sum(YAgg(end:-1:1,1:i-1),2)+YAgg(end:-1:1,i)+max(max(YY))/1e6],Col(mod(i-1,24)+1,:),'edgecolor','none');
        end
    end
end
plot([2012 2012],get(gca,'ylim'),'--','color',[.5 .5 .5],'linewidth',2);
L1990 = sum(interp1N(XX*ones(1,size(YY,2)),YY,1990*ones(1,size(YY,2))));
plot([XX(1) XX(end)],[L1990 L1990],'--','color',[.5 .5 .5],'linewidth',2);
set(gca,'xlim',[min(XX) max(XX)]);
zoom reset;
set(gca,'linewidth',2,'fontweigh','bold','fontsize',16,'box','on');
h = legend(L);
set(h,'fontsize',6,'fontweigh','normal','location','NorthEastOutside');
ylabel(Q)
hold off;
