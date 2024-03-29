function FTTTrplotXCat(X,Y,Q,L,Style)
%---FTTTrplotXCat(X,Y,Q,L,Style) with style argument (e.g. 'k--')
%---FTTTrplotXCat(X,Y,Q,L) no style argument (or empty ''): cycles colours and linestyles
%---Function that plots data from E3MG 
%---Adds appropriate legend using L as cell vector of categories
%---Q is the quantity on the Y label

if (nargin == 4 | isempty(Style))
    %No style argument is given
    S = size(Y,2);        
    plot(X,Y(:,1:min(S,6)),'-');
    if S > 6
        hold on;
        plot(X,Y(:,7:min(S,12)),'--');
    end
    if S > 12
        plot(X,Y(:,13:min(S,18)),':');
    end
    if S > 18
        plot(X,Y(:,19:min(S,24)),'-.');
    end
    if S > 24
        plot(X,Y(:,25:min(S,30)),'.');
    end
    if S > 30
        plot(X,Y(:,31:min(S,36)),'o');
    end
    if S > 36
        plot(X,Y(:,37:min(S,42)),'x');
    end
    if S > 42
        plot(X,Y(:,43:min(S,48)),'s');
    end
    if S > 48
        plot(X,Y(:,49:min(S,54)),'^');
    end
    if S > 54
        plot(X,Y(:,55:min(S,60)),'v');
    end
    if S > 60
        plot(X,Y(:,61:min(S,66)),'p');
    end
    if S > 66
        plot(X,Y(:,67:min(S,72)),'+');
    end
else
    %Here is style argument is given
    S = size(Y,2);        
    plot(X,Y,Style);
end
set(gca,'xlim',[min(X) max(X)]);
LL = get(gca,'ylim');
hold on; 
plot([2021 2021],LL,'--','color',[.5 .5 .5]);
%set(gca,'linewidth',2,'fontweigh','bold','fontsize',16,'box','on');
set(gca,'fontsize',10,'box','on');
h = legend(L);
%set(gcf,'position',[526 93 925 624]);
set(h,'fontsize',6,'location','NorthEastOutside');
ylabel(Q)
hold off;
