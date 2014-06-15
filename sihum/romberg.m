%!test
%! start = 0;
%! til = 1.570796;
%! res = romberg(start, til, "sinf");
%! expect = 1.03813;
%! assert(int32(res * 1000), int32(expect * 1000));
function out = romberg(start, til, fname)
  n = 5;
  A = zeros(n);

  for i=1:n
    d = 2^(i - 1);
    xs = linspace(start, til, d + 1);
    xslen = length(xs);
    y = zeros(1, xslen);

    for j=1:xslen
      y(1, j) = feval(fname, xs(j));
    end

    h = xs(2) - xs(1);
    sum_ = y(1, 1) + y(1, xslen);
    for j=2:(xslen - 1)
      sum_ += 2 * y(1, j);
    end
    A(1, i) = (h/2) * sum_;
  end

  for i=1:n
    for j=(i + 1):n
      A(i + 1, j) = (4^i * A(i, j) - A(i, j - 1)) / (4^i - 1);
    end
  end

  out = A(n, n);
end
