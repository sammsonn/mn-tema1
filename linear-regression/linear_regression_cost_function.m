function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Luăm dimensiunile
  m = length(FeatureMatrix);
  n = length(Theta);
  Error = 0;

  % Calculăm funcția de cost
  for i = 1:m
    h = 0;

    for j = 2:n
      h = h + Theta(j, 1) * FeatureMatrix(i, j - 1);
    endfor

    s = (h - Y(i))^2;
    Error = Error + s;
  endfor

  Error = Error / (2*m);
endfunction
