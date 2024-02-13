function [G, c] = get_Jacobi_parameters (Link)
  % Obținem dimensiunile matricii legăturilor
  [m, n] = size(Link);

  % Inițializăm o matrice rară goală
  G = sparse(m - 2, n - 2);
  % Extragem primele m-2 linii și primele n-2 coloane din matricea legăturilor
  G = Link(1:(m - 2), 1:(n - 2));

  % Inițializăm un vector rar gol
  c = sparse(m - 2, 1);
  % Extragem primele m-2 linii din coloana n-1 din matricea legăturilor
  c = Link(1:(m - 2), n - 1);
endfunction
