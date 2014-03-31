function r = lu_facto(A, b)
  [row, col] = size(A);
  U = A;
  L = eye(row, col);
  for i=1:row-1
    for j=i+1:row
      factor = U(j, i) / U(i, i);
      U(j, i:col) = U(j, i:col) - factor * U(i, i:col);
      L(j, i) = factor;
    end
  end

  z = b;
  for i=1:row
    for j=i+1:row
      factor = L(j, i) / L(i, i);
      z(j, 1) = z(j, 1) -  factor * z(i, 1);
    end
  end

  x = z;
  for i=row:-1:1
    inv_ = inv(U(i, i));
    U(i, :) = U(i, :) * inv_;
    x(i, 1) = x(i, 1) * inv_;
    for j=i-1:-1:1
      factor = U(j, i) / U(i, i);
      x(j, 1) = x(j, 1) - factor * x(i, 1);
    end
  end

  r = x;
end
