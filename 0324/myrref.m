function r = myrref(A)
    [row column] = size(A);
    m_column = column - 1;
    if det(A(:, 1:m_column)) == 0
      r = 0;
      return;
    end

    for i=1:1:row
      first = find_lead(A(i, :));
      A(i, :) = make_leading1(A(i, :));
      for j=1:1:row
        if i != j && A(j, first) != 0
          A(j, :) = A(j, :) - (A(j, first) * A(i, :));
        end
      end
    end

    r = sort_tri(A);
end
