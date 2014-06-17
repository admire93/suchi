%!test
%! res = euler2(0, 4, 20, 0.1);
%! expect = 0.0015238;
%! assert(int32(res * 10^6),  int32(expect * 10^6));
function out = euler2(start, til, n, y)
  X = linspace(start, til, n);
  h = X(2) - X(1);
  Y = zeros(1, n);
  Y(1) = y;

  function r_diff = diff(x, y)
    r_diff = exp(-2 * x) - 2 * y;
  end

  for i=1:n - 1
    f = diff(X(i), Y(i));
    y_star = Y(i) + h * diff(X(i), Y(i));
    f_star = diff(X(i + 1), y_star);
    Y(i + 1) = Y(i) + h * (f + f_star) / 2;
  end

  out = Y(1, n);
end
