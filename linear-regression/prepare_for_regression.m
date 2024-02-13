function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % Luăm dimensiunile matricii inițiale
  [m, n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n + 1);

  % Parcurgem elementele matricii
  for i = 1:m

    for j = 1:n
      % Transformăm cuvintele in cifre corespunzător
      if strcmp(InitialMatrix{i, j}, 'yes')
        FeatureMatrix(i, j) = 1;
      elseif strcmp(InitialMatrix{i, j}, 'no')
        FeatureMatrix(i, j) = 0;
      elseif strcmp(InitialMatrix{i, j}, 'semi-furnished')
        FeatureMatrix(i, j) = 1;
        FeatureMatrix(i, j + 1) = 0;
      elseif strcmp(InitialMatrix{i, j}, 'unfurnished')
        FeatureMatrix(i, j) = 0;
        FeatureMatrix(i, j + 1) = 1;
      elseif strcmp(InitialMatrix{i, j}, 'furnished')
        FeatureMatrix(i, j) = 0;
        FeatureMatrix(i, j + 1) = 0;
      % În rest păstrăm numerele
      elseif j == n
        FeatureMatrix(i, j + 1) = str2num(InitialMatrix{i, j});
      else
        FeatureMatrix(i, j) = str2num(InitialMatrix{i, j});
      endif

    endfor

  endfor

endfunction
