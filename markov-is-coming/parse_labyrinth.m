function [Labyrinth] = parse_labyrinth(file_path)
    fid = fopen(file_path, 'r');

    % Luam dimensiunile matricii, m linii si n coloane
    m = fscanf(fid, '%d', 1);
    n = fscanf(fid, '%d', 1);

    % fscanf citeste datele pe coloane, deci citim ca [n, m]
    % si apoi transpunem pentru a obtine orientarea corecta pe linii
    Labyrinth = fscanf(fid, '%d', [n, m])';
    
    fclose(fid);
end
