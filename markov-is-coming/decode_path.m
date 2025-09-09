function [decoded_path] = decode_path (path, lines, cols)

    % Eliminam starea Win daca este prezenta 
    if path(end) == lines * cols + 1
        path(end) = [];
    end

    % Initializam matricea rezultat
    l = length(path);
    decode_path = zeros(l, 2)
    
    % Convertim fiecare indice in pereche (linie, coloana)
    i = 1;
    for (k = 1:l)
        % Calcul coloana: restul impartirii la nr. de coloane
        decoded_path(i, 2) = mod(path(k)-1, cols)+1;

        % Calcul linie: partea intreaga a impartirii la nr. de coloane
        decoded_path(i, 1) = (path(k) - decoded_path(i, 2)) / cols + 1;
        i = i + 1;
    end

end
