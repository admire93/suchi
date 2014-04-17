function r = c(x, y, s)
  for i = 1:3
    hi = x(i+1) - x(i);
    r1 = (y(i+1)-y(i)) / hi;
    r2 = ((s(i+1) - s(i)) / 6) * hi;
    r3 = (hi * s(i)) / 2;
    r(i) = r1 - r2 - r3;
  end
end
