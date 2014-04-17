function r = p()
  x = [-3 -2 1 4];
  y = [2 0 3 1];
  s = [0 2.8276 -1.5502 0];
  r_a = a(x, y, s);
  r_b = b(x, y, s);
  r_c = c(x, y, s);
  r_x = [-3 -2 1];
  for i=1:3
    r(i) = polyval([r_a(i) r_b(i)  r_c(i) y(i)], r_x(i)-x(i));
  end
end
