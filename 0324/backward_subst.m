function B = backward_subst(A)
  [row, column] = size(A);
  for i=row:-1:2
    current_row = A(i, :);
    a = find_lead(current_row);
    for j=i-1:-1:1
      if A(j, a) != 0
        A(j, :) = A(j, :) - (A(j, a) / A(i, a) * current_row);
      end
    end
  end
  B = A;
end
