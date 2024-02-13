function [Link] = get_link_matrix (Labyrinth)
  % Obținem dimensiunile labirintului
  [m, n] = size(Labyrinth);
  % Inițializăm o matrice rară goală
  Link = sparse(n * m + 2, n * m + 2);

  % Iterăm prin fiecare celulă din labirint
  for i = 1:m

    for j = 1:n
      % Obținem reprezentarea binară a valorii zecimale din celula curentă
      binary_val = dec2bin(Labyrinth(i, j), 4);

      % Verificam pereții la nord, sud, est și vest de celula curentă
      north = binary_val(1);
      south = binary_val(2);
      east = binary_val(3);
      west = binary_val(4);

      ways = 1;
      % Calculăm câți vecini are celula curentă
      for k = 1:length(binary_val)

        if (binary_val(k) == '0')
          ways++;
        endif

      endfor

      ways--;

      % Dacă nu există zid la nord
      if (north == '0')

        % Dacă nu este pe primul rând
        if (i > 1)
          % Marcăm șansa de mutare cu elementul de deasupra
          Link((i - 1) * n + j, (i - 2) * n + j) = 1 / ways;
        else
          % Marcăm șansa de mutare cu starea de WIN
          Link(j, n * m + 1) = 1 / ways;
        endif

      endif

      % Dacă nu există zid la sud
      if (south == '0')
        % Dacă nu este pe ultimul rând
        if (i < m)

          % Marcăm șansa de mutare cu elementul de dedesubt
          Link((i - 1) * n + j, i * n + j) = 1 / ways;
        else
          % Marcăm șansa de mutare cu starea de WIN
          Link((i - 1) * n + j, n * m + 1) = 1 / ways;
        endif

      endif

      % Dacă nu există zid la est
      if (east == '0')

        % Dacă nu este pe ultima coloană
        if (j < n)
          % Marcăm șansa de mutare cu elementul din dreapta
          Link((i - 1) * n + j, (i - 1) * n + j + 1) = 1 / ways;
        else
          % Marcăm șansa de mutare cu starea de LOSE
          Link(i * n, n * m + 2) = 1 / ways;
        endif

      endif

      % Dacă nu există zid la vest
      if (west == '0')
        % Dacă nu este pe prima coloană
        if (j > 1)
          % Marcăm șansa de mutare cu elementul din stânga
          Link((i - 1) * n + j, (i - 1) * n + j - 1) = 1 / ways;
        else
          % Marcăm șansa de mutare cu starea de LOSE
          Link((i - 1) * n + 1, n * m + 2) = 1 / ways;
        endif

      endif

    endfor

  endfor

  % Marcăm șansa de mutare între stări cu ele însuși
  Link(n * m + 1, n * m + 1) = 1;
  Link(n * m + 2, n * m + 2) = 1;
endfunction
