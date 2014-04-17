function r = a(x, y, s)
  for i = 1:3
    r(i) = (s(i+1) - s(i)) / (6 * (x(i+1) - x(i)));
  end
end
