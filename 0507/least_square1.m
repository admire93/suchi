function r = least_square1(x, y, x0)
  n = length(x);
  S = zeros(2);
  S(1, 1) = n;
  x1 = sum(x);
  S(1, 2) = x1;
  S(2, 1) = x1;
  S(2, 2) = sum(x.*x);

  F = zeros(2, 1);
  F(1, 1) = sum(y);
  F(2, 1) = sum(x.*y);

  A = inv(S) * F;

  r = polyval(fliplr(A'), x0);
end
