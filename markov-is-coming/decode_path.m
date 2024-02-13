function [decoded_path] = decode_path (path, lines, cols)
  % Inițializăm un vector gol
  decoded_path = [];

  % Iterăm pe path și convertim indicii de stare în perechi
  for i = 1:length(path)
    % Calculăm indici de linii și coloane
    line_nr = ceil(path(i) / cols);
    col_nr = mod(path(i) - 1, cols) + 1;

    % Adăugați indici de linii și coloane ca o pereche la decoded_path
    decoded_path = [decoded_path; [line_nr, col_nr]];
  endfor

  % Eliminăm ultimul element al vectorului decoded_path (starea de WIN)
  decoded_path = decoded_path(1:end - 1, :);
endfunction
