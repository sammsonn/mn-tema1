function [J, grad] = cost_function(params, X, y, lambda, input_layer_size, hidden_layer_size, output_layer_size)
  % Reformăm vectorul de parametri în matrici de weights
  Theta1_size = (input_layer_size + 1) * hidden_layer_size;
  Theta1 = reshape(params(1:Theta1_size), hidden_layer_size, input_layer_size + 1);
  Theta2_size = (hidden_layer_size + 1) * output_layer_size;
  Theta2 = reshape(params(Theta1_size + 1:end), output_layer_size, hidden_layer_size + 1);

  m = size(X, 1);
  J = 0;
  Theta1_grad = zeros(size(Theta1));
  Theta2_grad = zeros(size(Theta2));

  % Facem forward propagation pentru a calcula costul
  a1 = [ones(m, 1) X]';
  z2 = Theta1 * a1;
  a2 = sigmoid(z2);
  [a b] = size(a2);
  ones_row = ones(1, b);
  a2 = vertcat(ones_row, a2);
  z3 = Theta2 * a2;
  a3 = sigmoid(z3);

  % Construim o matrice din y
  y_matrix = eye(output_layer_size)(:, y);
  J = (1 / m) * sum(sum((-y_matrix .* log(a3)) - ((1 - y_matrix) .* log(1 - a3))));

  reg = (lambda / (2 * m)) * (sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:, 2:end).^2)));
  J = J + reg;

  % Facem backpropagation pentru a calcula gradienții
  d3 = a3 - y_matrix;
  d2 = (Theta2(:, 2:end)' * d3) .* sigmoid(z2) .* (1 - sigmoid(z2));
  Delta1 = d2 * a1';
  Delta2 = d3 * a2';
  Theta1_grad = (1 / m) * Delta1;
  Theta2_grad = (1 / m) * Delta2;

  % Adăugăm termenul de regularizare la gradienți
  Theta1_grad(:, 2:end) = Theta1_grad(:, 2:end) + ((lambda / m) * Theta1(:, 2:end));
  Theta2_grad(:, 2:end) = Theta2_grad(:, 2:end) + ((lambda / m) * Theta2(:, 2:end));

  % Desfășurăm gradienți într-un singur vector coloană
  grad = [Theta1_grad(:); Theta2_grad(:)];
endfunction
