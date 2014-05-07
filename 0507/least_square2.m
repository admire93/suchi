function r = least_square2(x, y, x0)
  n = length(x);
  S = zeros(3);
  S(1, 1) = n;
  x1 = sum(x);
  S(1, 2) = x1;
  S(2, 1) = x1;
  x2 = sum(x.*x);
  S(3, 1) = x2;
  S(2, 2) = x2;
  S(1, 3) = x2;
  x3 = sum(x.*x.*x);
  S(2, 3) = x3;
  S(3, 2) = x3;
  S(3, 3) = sum(x.*x.*x.*x);

  F = zeros(3, 1);
  F(1, 1) = sum(y);
  F(2, 1) = sum(x.*y);
  F(3, 1) = sum(x.*x.*y);

  A = inv(S) * F;

  r = polyval(fliplr(A'), x0);
end
