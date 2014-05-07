function out = least_squarea(x, y, na, x0)
  n = length(x);
  if na < 1
    disp('n차 함수의 n이 잘못되었습니다.');
    return
  end

  n1 = na + 1;
  S = zeros(n1);
  S(1, 1) = 1;

  for i=2:n1
    x_mult = x;
    for j=2:i-1
      x_mult = x_mult .* x;
    end
    S(i, 1) = sum(x_mult);

    sub_x_mult = x_mult;
    for j=2:n1
      sub_x_mult = sub_x_mult .* x;
      S(i, j) = sum(sub_x_mult);
    end
  end

  S(1, 1) = n;
  for i=2:n1
    S(1, i) = S(2, i - 1);
  end

  F = zeros(n1, 1);
  x_mult = x ./ x;
  for i=1:n1
    F(i, 1) = sum(x_mult .* y);
    x_mult = x .* x_mult;
  end

  A = inv(S) * F;

  r = polyval(fliplr(A'), x0);

  printf('x=%.1f 에서 %d 차 다항식에 의한 최소 자승법의 근사값: %.3f\n',
         x0, na, r);
end
