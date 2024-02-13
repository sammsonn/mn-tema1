function [path] = heuristic_greedy(start_position, probabilities, Adj)
  % Obținem lungimea matricei de adiacență
  n = length(Adj);
  % Inițializăm vectorul de vizitare cu zero-uri
  visited = zeros(1, n);
  % Marcăm poziția de pornire ca vizitată
  visited(start_position) = 1;
  % Inițializăm vectorul de drum cu poziția de pornire
  path = [start_position];

  while ~isempty(path)
    % Luăm ultima poziție din vectorul de drum
    position = path(end);

    if position == n - 1
      path = path';
      return
    endif

    % Determinăm vecinii poziției curente
    neighbours = find(Adj(position, :));
    % Determinăm vecinii nevizitați
    unvisited_neighbours = setdiff(neighbours, find(visited));

    % Daca poziția curentă nu are vecini nevizitați, o eliminăm din drum
    if isempty(unvisited_neighbours)
      path(end) = [];
    else
      % Determinăm vecinul nevizitat cu cea mai mare probabilitate de a ajunge la WIN
      [~, max_prob_index] = max(probabilities(unvisited_neighbours));
      next_position = unvisited_neighbours(max_prob_index);
      % Îl marcăm ca vizitat
      visited(next_position) = 1;
      % Îl adăugăm in vectorul de drum
      path = [path, next_position];
    endif

  endwhile

  % Daca am ajuns aici, înseamnă că nu există drum catre WIN
  path = [];
endfunction
