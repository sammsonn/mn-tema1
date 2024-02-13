function [matrix] = initialize_weights(L_prev, L_next)
  % Îl calculăm pe ε
  epsilon = sqrt(6) / sqrt(L_prev + L_next);
  % Construim o matrice cu elemente la întâmplare din intervalul (−ε, ε)
  matrix = rand(L_next, L_prev + 1) * 2 * epsilon - epsilon;
endfunction
