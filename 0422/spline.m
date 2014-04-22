function r = spline(x, y, idx, x0)
  % x(idx) < x0 < x(idx+1) 인 idx와 x0를 구해야함
  % 정렬해서 구하면 되지만 그냥 입력하는걸로...
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

  R(1) = (s(idx + 1) - s(idx)) / (6 * h(idx));
  R(2) = s(idx) / 2;
  r31 = (y(idx + 1) - y(idx)) / h(idx);
  r32 = ( (s(idx + 1) - s(idx)) / 6 ) * h(idx);
  r33 = ( s(idx) / 2 ) * h(idx);
  R(3) = r31 - r32 - r33;
  R(4) = y(idx);

  r = polyval(R, x0 - x(idx));
end
