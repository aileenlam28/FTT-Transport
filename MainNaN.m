function [C,D] = MainNaN(A,B)
%---function [C,D] = MainNaN(A,B)
%---Fonction qui enl�ve les NaN et les Inf d'un vecteur
%---Retourne des vecteurs moins longs, retire simplement les NaN, Inf
%---S'il y a un NaN dans A ou B � la ni�me position, on enl�ve la ni�me 
%---composante des vecteurs A et B et ceux-ci seront moins longs d'une unit�
%---Utile pour enlever les NaN et Inf avant de faire une r�gression polyn�miale

if length(A) ~= length(B)
   C = -1;
   D = -1;
   return;
end

%-Matrice 1 partout et des 0 aux endroits o� il y a des NaN, Inf dans A ou B
NaNInf = not(isnan(A) | isinf(A) | isnan(B) | isinf(B));

C = A(find(NaNInf));
D = B(find(NaNInf));

