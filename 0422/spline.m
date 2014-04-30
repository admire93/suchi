function r = spline(x, y, x0)

  xsize = length(x);
  hsize = xsize - 1;
  Asize = xsize - 2;

  for i=1:hsize
    h(i) = x(i + 1) - x(i);
  end

  for i=1:Asize
    A(i, i) = h(i);
    A(i, i + 1) = 2 * (h(i) + h(i + 1));
    A(i, i + 2) = h(i + 1);
  end

  [arow, acol] = size(A);
  acol_1 = acol - 1;
  A = A(:, 2:acol_1);
  arow_1 = arow + 1;

  for i=2:arow_1
    ff = (y(i + 1) - y(i)) / h(i);
    fb = (y(i) - y(i - 1)) / h(i - 1);
    A(i - 1, acol_1) = 6 * (ff - fb);
  end

  Sr = rref(A);
  s = [0 Sr(:, acol_1)' 0];

  for i=1:hsize
    p(i, 1) = (s(i + 1) - s(i)) / (6 * h(i));
    p(i, 2) = s(i) / 2;
    r31 = (y(i + 1) - y(i)) / h(i);
    r32 = ( (s(i + 1) - s(i)) / 6 ) * h(i);
    r33 = ( s(i) / 2 ) * h(i);
    p(i, 3) = r31 - r32 - r33;
    p(i, 4) = y(i);
  end

  for i=2:hsize
    if x(i) > x0
      break;
    end
  end

  r = polyval(p(i - 1, :), x0 - x(i - 1));
end
