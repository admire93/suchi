function B = get_ans(A)
  [row, column] = size(A);
  B = A(:, column)';
end
