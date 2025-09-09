function [Adj] = get_adjacency_matrix(Labyrinth)
    [m, n] = size(Labyrinth);

    % Initializam ca matrice rara pentru eficienta
    Adj = sparse(m * n + 2, m * n + 2);

    for i = 1:m

        for j = 1:n

            % Calculam indicele pozitiei curente pe care o modificam in matricea Adj
            k = (i - 1) * n + j;

            % Verificam daca exista perete la Vest
            % Daca nu exista verificam daca este stare de Lose sau legatura
            if bitand(Labyrinth(i, j), 1) == 0

                if j > 1
                    Adj(k, k - 1) = 1;
                else
                    Adj(k, m * n + 2) = 1;
                end

            end

            % Verificam daca exista perete la Est
            % Daca nu exista verificam daca este stare de Lose sau legatura
            if bitand(Labyrinth(i, j), 2) == 0

                if j < n
                    Adj(k, k + 1) = 1;
                else
                    Adj(k, m * n + 2) = 1;
                end

            end

            % Verificam daca exista perete la Sud
            % Daca nu exista verificam daca este stare de Win sau legatura
            if bitand(Labyrinth(i, j), 4) == 0

                if i < m
                    Adj(k, k + n) = 1;
                else
                    Adj(k, m * n + 1) = 1;
                end

            end

            % Verificam daca exista perete Nord
            % Daca nu exista verificam daca este stare de Win sau legatura
            if bitand(Labyrinth(i, j), 8) == 0

                if i > 1
                    Adj(k, k - n) = 1;
                else
                    Adj(k, m * n + 1) = 1;
                end

            end

        end

    end

    % Stim ca starile de Win si Lose sunt absorbante
    Adj(m * n + 1, m * n + 1) = 1;
    Adj(m * n + 2, m * n + 2) = 1;
end
