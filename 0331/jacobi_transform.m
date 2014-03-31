function [Ta Tb] = jacobi_transform(A, b)
  function r = is_transformed(X)
    [xr, xc] = size(X);
    r = 1;
    for i=1:xr
      r = r && (X(i, i) == 0);
    end
  end

  [row, column] = size(A);
  if is_transformed(A)
    Ta = A;
    Tb = b;
    return;
  end

  for i=1:row
    if A(i, i) != 0
      inv_a_i = inv(A(i, i));
      A(i, :) =  inv_a_i * A(i, :);
      A(i, i) = 0;
      b(i, 1) = inv_a_i * b(i, 1);
    end
  end
  Ta = A;
  Tb = b;
end
