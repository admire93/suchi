function B = sort_tri(A)
  [row, column] = size(A);
  for i=1:1:row
    l = find_lead(A(i, :));
    if l != i
      temp = A(i, :);
      A(i, :) = A(l, :);
      A(l, :) = temp;
    end
  end
  B = A;
end