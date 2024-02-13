function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Luăm dimensiunile
  m = length(FeatureMatrix);
  n = length(Theta);
  Error = 0;
  patrat = 0;

  % Aplicăm regularizarea L2
  for i = 1:m
    h = 0;

    for j = 2:n
      h = h + Theta(j, 1) * FeatureMatrix(i, j - 1);
    endfor

    s = (h - Y(i))^2;
    Error = Error + s;
  endfor

  % Calculăm termenul specific regularizării
  for i = 1:n
    patrat = patrat + Theta(i, 1)^2;
  endfor

  Error = Error / (2 * m) + lambda * patrat;
endfunction
