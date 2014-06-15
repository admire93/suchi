%!test
%! x = [1, 2, 3, 5, 7];
%! y = [2.3, 4, 4.5, 6.2, 6.3];
%! expect = 5.2086;
%! res = least_square(x, y, 3.5);
%! assert(int32(res * 10000), int32(expect * 10000));
function out = least_square(x, y, xguess)
  n = 3;
  n0 = length(x);
  n1 = n + 1;

  B = zeros(1, n1 + n1);
  B(1, 1) = B(1, 2) = n0;
  mul_x = x;
  for i=3:n1 + n1
    B(1, i) = sum(mul_x);
    mul_x = mul_x .* x;
  end
  % expect of B = [2 2 18 88 504 3124]

  S = zeros(n1);
  for i=1:n1
    for j=1:n1
      S(i, j) = B(1, i + j);
    end
  end
  % expect of S = [2  18 88;
  %                18 88 504;
  %                88 504 3124]

  F = zeros(n1, 1);
  mul_y = y;
  for i=1:n1
    F(i, 1) = sum(mul_y);
    mul_y = mul_y .* x;
  end
  % expect of F = [23.3; 98.9; 522.5];

  A = inv(S) * F;

  out = polyval(fliplr(A'), xguess);
end
