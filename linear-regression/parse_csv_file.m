function [Y, InitialMatrix] = parse_csv_file(file_path)
  fid = fopen(file_path, 'r');

  % Citim linia antetului
  header = fgetl(fid);

  % Utilizăm textscan pentru a citi datele
  data = textscan(fid, '%f %s %s %s %s %s %s %s %s %s %s %s %s', 'Delimiter', ',', 'HeaderLines', 0);

  fclose(fid);

  % Convertim datele într-un cell array
  InitialMatrix = [data{2}, data{3}, data{4}, data{5}, data{6}, data{7}, data{8}, data{9}, data{10}, data{11}, data{12}, data{13}];

  % Extrage vectorul Y
  Y = data{1};

endfunction
