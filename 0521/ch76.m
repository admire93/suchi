function r = ch76(a, b, j)
  n = 2^(j - 1) + 1;
  x = linspace(a, b, n);
  A = zeros(j, j);
  function yr = f(xr)
    yr = xr^2 * sin(xr^2);
  end
  xl = length(x);
  for i=1:xl
    y(1, i) = f(x(i));
  end
  h = x(xl) - x(1);
  for i=1:j
    sum_ = 0;
    c = 2^(i - 1);
    curr_h = (h / c);
    for k=1:2^(j - i):xl
      sum_ += 2 * y(k);
    end
    sum_ -= y(1);
    sum_ -= y(xl);
    sum_ = (curr_h / 2) * sum_;
    A(1, i) = sum_;
  end

  for i=2:j
    m = 4^(i - 1);
    for k=i:j
      A(i, k) = (m * A(i - 1, k) - A(i - 1, k - 1)) / (m - 1);
    end
  end

  printf('주어진 함수 x^2sinx(x^2) %f 에서 %f 까지 적분값은: %f \n', a, b, A(j, j));
end
