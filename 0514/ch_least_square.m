function out = ch_least_square(x, y, x0)
  n = length(x);
  S = zeros(2);
  S(1, 1) = n;
  x1 = sum(x);
  S(1, 2) = x1;
  S(2, 1) = x1;
  S(2, 2) = sum(x .* x);

  F = zeros(2, 1);
  F(1, 1) = sum(reallog(y));
  F(2, 1) = sum(x .* reallog(y));

  A = inv(S) * F;

  r = exp(A(1, 1)) * exp(A(2, 1) * x0);
  printf('x=%.1f 에서 변환에 의한 최소 자승법의 근사값: %.3f\n', x0, r);
end
