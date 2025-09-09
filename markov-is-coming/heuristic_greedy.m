function [path] = heuristic_greedy(start_position, probabilities, Adj)

    % Initializam drumul cu pozitia de start
    path = [start_position];
    pos = start_position;
    [n, n] = size(Adj);

    % Vector pentru a marca starile vizitate
    visited = zeros(n, 1);
    visited(pos) = 1;

    win = length(probabilities) - 1;
    lose = length(probabilities);

    while isempty(path) != 1
        % Pozitia curenta
        pos = path(end);

        % Verificam daca am ajuns la WIN
        if pos == win
            return;
        end

        % Gasim vecinii posibili
        neighbours = find(Adj(pos, :));

        % Filtram vecinii nevizitati
        unvisited_neighbours = neighbours(~visited(neighbours));

        % Verificam daca mai exista vecini nevizitati
        if isempty(unvisited_neighbours)
            path(end) = [];
            % Daca nu mai exista vecini nevizitati eliminam ultima pozitie din cale
        else
            % Alegem vecinul cu probabilitatea maxima
            [~, i] = max(probabilities(unvisited_neighbours));
            next_pos = unvisited_neighbours(i);

            % Actualizam drumul si vizitele
            visited(next_pos) = 1;
            path = [path, next_pos];
        end

    end

end
