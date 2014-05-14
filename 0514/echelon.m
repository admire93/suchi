function out = echelon(x, y)
  lx = length(x);

  s = 0;
  h = x(2) - x(1);
  r2 = 0;
  for i=2:lx - 1
    r2 += y(i);
  end

  s = (h / 2) * (y(1) + y(lx) + 2 * r2);
  out = s;
end
