function [Link] = get_link_matrix(Labyrinth)
    % Calculam matricea Adj cu ajutorul functiei anterioare
    Adj = get_adjacency_matrix(Labyrinth);

    % Initializam matricea Link ca matrice rara
    [n, n] = size(Adj);
    Link = sparse(n, n);

    % Calculam numarul de elemente nenule pe fiecare linie (numarul de vecini)
    % si impartim elementele liniei respective la acesta
    for i = 1:n
        vecini = 0;

        for j = 1:n
            vecini = vecini + Adj(i, j);
        end

        if vecini > 0
            Link(i, :) = Adj(i, :) / vecini;

        end

    end

end
