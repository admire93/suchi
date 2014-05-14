function out = rectangle(x, y)
  lx = length(x);

  s = 0;
  for i=1:lx - 1
    s += (x(i + 1) - x(i)) * y(i);
  end

  out = s;
end
