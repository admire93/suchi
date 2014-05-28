function out = ch8(a, b, n, y)
  X = linspace(a, b, n);
  h = X(2) - X(1);

  A = zeros(n, 4);
  for i=1:n
    A(i, 1) = X(i);
  end

  for i=2:4
    A(1, i) = y;
  end

  function r_diff = diff(x, y)
    r_diff = exp(-2 * x) - 2 * y;
  end

  for i=2:n
    A(i, 2) = A(i - 1, 2) + h * diff(A(i - 1, 1), A(i - 1, 2));
  end

  for i=2:n
    %A(i, 3) =
    fi = diff(A(i - 1, 1), A(i - 1, 3));
    y_star = A(i - 1, 3) + h * fi;
    A(i, 3) = A(i - 1, 3) + (h / 2) * (fi + diff(A(i, 1), y_star));
  end

  function r_real_f = real_f(x)
    r_real_f = (1/10) * exp(-2 * x) + x * exp(-2 * x);
  end

  for i=2:n
    A(i, 4) = real_f(A(i, 1));
  end

  [row, column] = size(A);

  printf('  x값\t\t오일러\t\t개선\t\t실제\n');
  for i=1:row
    printf('%f\t%f\t%f\t%f\n', A(i, :));
  end
end
