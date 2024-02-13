function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % Inițializăm Theta și J
  Theta = zeros(n + 1);
  J = zeros(n + 1);

  % Calculăm gradientul funcției de cost
  for j = 1:n
    s = 0;

    for i = 1:m
      h = 0;

      for k = 2:n
        h = h + Theta(k, 1) * FeatureMatrix(i, k - 1);
      endfor

      s = s + (h - Y(i)) * FeatureMatrix(i, j);
    endfor

    J(j + 1, 1) = s / m;
  endfor

  % Transformăm pentru a-l afla pe Theta
  for j = 1:n

    for i = 1:iter
      Theta(j + 1, 1) = Theta(j + 1, 1) - alpha * J(j + 1, 1);
    endfor

  endfor

endfunction
