function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % Determinam numarul total de exemple in setul de date
  m = size(X, 1);

  % Generăm o permutare aleatoare a numerelor de la 1 la numarul total de exemple
  indices = randperm(m);

  % Calculam numarul de exemple care vor fi adaugate in setul de antrenare
  train_size = floor(percent * m);

  % Selectăm primele train_size exemple din permutare și le adăugam in setul de antrenare
  train_indices = indices(1:train_size);
  X_train = X(train_indices, :);
  y_train = y(train_indices);

  % Selectăm restul de exemple și le adăugăm in setul de test
  test_indices = indices(train_size + 1:end);
  X_test = X(test_indices, :);
  y_test = y(test_indices);
endfunction
