%!test
%! start = 0;
%! til = 1.570796;
%! res = romberg(start, til, "sinf");
%! expect = 1.03813;
%! assert(int32(res * 1000), int32(expect * 1000));
function out = romberg(start, til, fname)
  a = 5;
  n = 2^a + 1;
  xs = linspace(start, til, n);
  ys = zeros(1, a);
  for i=1:n
    ys(1, i) = feval(fname, xs(i));
  end

  h = xs(2) - xs(1);

  A = zeros(a, a);

  for i=1:a
    sum_ = 0;
    for j=1:2^(a - i + 1):n
      sum_ += 2 * ys(j);
    end

    sum_ -= ys(1);
    sum_ -= ys(n);

    A(1, i) = 2^(a - i) * h * sum_;
  end

  for i=1:a
    for k=(i + 1):a
      mul = 4^i;
      A(i + 1, k) = (mul * A(i, k) - A(i, k - 1)) / (mul - 1);
    end
  end

  out = A(a, a);
end
