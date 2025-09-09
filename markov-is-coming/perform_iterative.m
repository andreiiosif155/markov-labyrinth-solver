function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
    x = x0;
    [n, n] = size(G)
    steps = 0;
    err = tol + 1;

    while (err > tol && steps < max_steps)
        x2 = x; % Salvam solutia anterioara
        x = G * x2 + c; % Actualizam solutia
        steps = steps + 1;
        err = norm(x - x2, 2); % Calculam eroarea
    end

end
