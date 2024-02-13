function [classes] = predict_classes(X, weights, input_layer_size, hidden_layer_size, output_layer_size)
  % Numărul de exemple de date de intrare
  m = size(X, 1);

  % Reforma vectorul de weights în matrice pentru fiecare strat
  Theta1_size = (input_layer_size + 1) * hidden_layer_size;
  Theta1 = reshape(weights(1:Theta1_size), hidden_layer_size, input_layer_size + 1);
  Theta2_size = (hidden_layer_size + 1) * output_layer_size;
  Theta2 = reshape(weights(Theta1_size + 1:end), output_layer_size, hidden_layer_size + 1);

  % Facem forward propagation pentru a calcula costul
  a1 = [ones(m, 1) X];
  z2 = Theta1 * a1';
  a2 = sigmoid(z2);
  a2 = [ones(1, m); a2];
  z3 = Theta2 * a2;
  a3 = sigmoid(z3);

  % Determinăm clasa prezisă pentru fiecare exemplu
  [~, classes] = max(a3, [], 1);
  classes = classes';

endfunction
