function r = lagrange_interpolation(y, x, x0)
  sum_ = 0;
  [row, n] = size(x);
  for i=1:n
    temp = y(i)
    for j=1:n
      if i ~= j
        temp = temp * ((x0 - x(j)) / (x(i) -x(j)));
      end
    end
    sum_ += temp;
  end
  r = sum_;
end
