function r = myref(A)
    [row column] = size(A);
    m_column = column - 1;
    if det(A(:, 1:m_column)) == 0
      r = 0;
      return;
    end

    for i=1:1:row
      f = find_lead(A(i, :));
      for j=i+1:1:row
        mult = A(j, f) / A(i, f);
        A(j, :) = A(j, :) - (mult * A(i, :));
      end
    end
    A = sort_tri(A);

    for i=1:1:row
      A(i, :) = make_leading1(A(i, :));
    end
    r = A;
end
