function [X, y] = load_dataset(path)
  % Încarcă setul de date
  data = load(path);

  % Extrage matricea de intrare și vectorul de ieșire din structura de date
  X = data.X;
  y = data.y;
endfunction
