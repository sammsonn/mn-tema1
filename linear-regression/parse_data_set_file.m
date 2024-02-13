function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % Deschidem fișierul
  fileID = fopen(file_path, 'r');

  % Citim prima linie pentru a obține m și n
  first_line = fgetl(fileID);
  split_first_line = strsplit(first_line, ' ');
  m = str2num(split_first_line{1});
  n = str2num(split_first_line{2});

  % Citim rândurile rămase pentru a obține setul de date
  InitialMatrix = cell(m, n);

  for i = 1:m
    line = fgetl(fileID);
    split_line = strsplit(line, ' ');
    Y(i) = str2num(split_line{1});

    for j = 2:n + 1
      InitialMatrix{i, j - 1} = split_line{j};
    endfor

  endfor

  fclose(fileID);

endfunction
