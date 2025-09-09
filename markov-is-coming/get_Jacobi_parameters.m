function [G, c] = get_Jacobi_parameters (Link)
	[n, n] = size(Link);
    
    G=sparse(n-2, n-2);
    c=zeros(n-2,1);

    % Extrage submatricea G din Link
    for i=1:n-2
        for j=1:n-2
        G(i,j)=Link(i,j);
        end
    end

    % Extrage vectorul c din Link 
    for i=1:n-2
        c(i)=Link(i,n-1);
    end
end