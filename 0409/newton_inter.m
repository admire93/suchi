function r = newton_inter(x, y, x0)
  [row, column] = size(x);
  A = eye(column);
  A = [x', A];
  A(:, 2) = y';
  [r, c] = size(A);
  for i=3:c
    for j=(i-1):r
      A(j, i) = (A(j, i - 1) - A(j - 1, i - 1)) / (A(j, 1) - A(j - (i - 2), 1));
    end
  end
  sum_ = 0;
  for i=2:c
    temp = A(i - 1, i);
    for j=1:i-2
      temp *= (x0 - A(j, 1));
    end
    sum_ += temp;
    pi = i-2
    sum_
  end
  r = sum_;
end
