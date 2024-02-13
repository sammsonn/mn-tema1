function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  [m n] = size(FeatureMatrix);
  [m p] = size(Y);
  Theta = zeros(n, p);
  z = zeros(1, p);
  % Aplicăm metoda gradientului conjugat
  Y = FeatureMatrix' * Y;
  r = Y;
  v = r;
  
  A = FeatureMatrix' * FeatureMatrix;
  eig_values = eig(A);

  % Dacă A nu este pozitiv definită
  if !all(eig_values > 0)
    Theta = vertcat(z, Theta);
    return;
  endif

  tol = tol^2;
  k = 1;

  while k <= iter && (r' * r) > tol
    t = (r' * r) / (v' * A * v);
    Theta = Theta + t * v;
    s = ((r - t * A * v)' * (r - t * A * v)) / (r' * r);
    r = r - t * A * v;
    v = r + s * v;
    k = k + 1;
  endwhile

  % Adăugăm o linie goală la Theta
  Theta = vertcat(z, Theta);
endfunction
