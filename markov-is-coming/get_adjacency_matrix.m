function [Adj] = get_adjacency_matrix(Labyrinth)
  % Obținem dimensiunile labirintului
  [m, n] = size(Labyrinth);
  % Inițializăm o matrice rară goală
  Adj = sparse(n * m + 2, n * m + 2);

  % Iterăm prin fiecare celulă din labirint
  for i = 1:m

    for j = 1:n
      % Obținem reprezentarea binară a valorii zecimale din celula curentă
      binary_val = dec2bin(Labyrinth(i, j), 4);

      % Verificăm pereții la nord, sud, est și vest de celula curentă
      north = binary_val(1);
      south = binary_val(2);
      east = binary_val(3);
      west = binary_val(4);

      % Dacă nu există zid la nord
      if (north == '0')

        % Dacă nu este pe primul rând
        if (i > 1)
          % Marcăm adiacența cu elementul de deasupra
          Adj((i - 1) * n + j, (i - 2) * n + j) = 1;
        else
          % Marcăm adiacența cu starea de WIN
          Adj(j, n * m + 1) = 1;
        endif

      endif

      % Dacă nu există zid la sud
      if (south == '0')

        % Dacă nu este pe ultimul rând
        if (i < m)
          % Marcăm adiacența cu elementul de dedesubt
          Adj((i - 1) * n + j, i * n + j) = 1;
        else
          % Marcăm adiacența cu starea de WIN
          Adj((i - 1) * n + j, n * m + 1) = 1;
        endif

      endif

      % Dacă nu există zid la est
      if (east == '0')

        % Dacă nu este pe ultima coloană
        if (j < n)
          % Marcăm adiacența cu elementul din dreapta
          Adj((i - 1) * n + j, (i - 1) * n + j + 1) = 1;
        else
          % Marcăm adiacența cu starea de LOSE
          Adj(i * n, n * m + 2) = 1;
        endif

      endif

      % Dacă nu există zid la vest
      if (west == '0')

        % Dacă nu este pe prima coloană
        if (j > 1)
          % Marcăm adiacența cu elementul din stânga
          Adj((i - 1) * n + j, (i - 1) * n + j - 1) = 1;
        else
          % Marcăm adiacența cu starea de LOSE
          Adj((i - 1) * n + 1, n * m + 2) = 1;
        endif

      endif

    endfor

  endfor

  % Marcăm adiacența între stări cu ele însuși
  Adj(n * m + 1, n * m + 1) = 1;
  Adj(n * m + 2, n * m + 2) = 1;
endfunction
