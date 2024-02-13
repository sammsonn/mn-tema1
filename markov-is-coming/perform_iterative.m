function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
  % Determinăm dimensiunea sistemului de ecuații liniare
  n = length(c);
  % Inițializăm soluția aproximativă cu valorile inițiale
  x = x0;

  for steps = 1:max_steps
    % Reținem valorile anterioare ale soluției
    x_old = x;
    % Calculăm o nouă aproximare a solutiei
    x = G * x + c;
    % Calculăm eroarea relativă
    err = norm(x - x_old);
    % Daca eroarea este acceptabilă, ieșim din buclă
    if err < tol
      break
    endif

  endfor

endfunction
