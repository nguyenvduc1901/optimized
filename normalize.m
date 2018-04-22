function [T] = normalize(NT)
    Ecart = 0; 
	Moy = 0;
	[N_pattern, p] = size(NT);
    
    for k = 1:p
        for i=1:N_pattern
            Moy = Moy + NT(i,k);
        end
        Moy = Moy / (N_pattern);
    	for i=1:N_pattern
            Ecart = Ecart + (Moy - NT(i,k)) * (Moy - NT(i,k));
        end
        Ecart = sqrt(Ecart /(N_pattern));
        NT(:,k) = (NT(:,k) - Moy)/Ecart;      
        Ecart = 0;
        Moy = 0;
    end
    T = NT;
end