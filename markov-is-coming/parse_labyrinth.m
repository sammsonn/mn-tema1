function [Labyrinth] = parse_labyrinth(file_path)
  fileID = fopen(file_path, 'r');

  % Citim dimensiunile matricei labirintului
  dimensions = fscanf(fileID, '%d %d', [1 2]);
  m = dimensions(1);
  n = dimensions(2);

  % Inițializam matricea labirintului
  Labyrinth = zeros(m, n);

  % Parcurgem m linii și introducem elementele în matricea labirintului
  for i = 1:m
    row = fscanf(fileID, '%d', [1 n]);
    Labyrinth(i, :) = row;
  endfor

  fclose(fileID);
endfunction
