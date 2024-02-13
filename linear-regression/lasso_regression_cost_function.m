function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Luăm dimensiunile
  m = length(FeatureMatrix);
  n = length(Theta);
  Error = 0;
  norma = 0;

  % Aplicăm regularizarea L1
  for i = 1:m
    h = 0;

    for j = 2:n
      h = h + Theta(j, 1) * FeatureMatrix(i, j - 1);
    endfor

    s = (Y(i) - h)^2;
    Error = Error + s;
  endfor

  % Calculăm norma
  for i = 1:n
    norma = norma + abs(Theta(i, 1));
  endfor

  Error = Error / m + lambda * norma;

endfunction
