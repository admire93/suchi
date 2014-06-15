%!test
%! res = euler2(0, 4, 20, 0.1);
%! expect = 0.0015238;
%! assert(int32(res * 10^6),  int32(expect * 10^6));
function out = euler2(start, til, n, y)
  xs = linspace(start, til, n);
  h = xs(2) - xs(1);

  function r_diff = diff(x, y)
    r_diff = exp(-2 * x) - 2 * y;
  end

  ys = zeros(1, length(xs));
  ys(1, 1) = y;

  for i=1:(length(xs) - 1)
    f = diff(xs(1, i), ys(1, i));
    ystar = ys(1, i) + h * f;
    fstar = diff(xs(i + 1), ystar);
    ys(1, i + 1) = ys(1, i) + h * ((f + fstar) / 2);
  end

  out = ys(length(xs));
end
