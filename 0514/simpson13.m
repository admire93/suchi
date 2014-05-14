function out = simpson13(x, y)
  lx = length(x);
  if rem(lx, 2) != 1 || lx < 2
    disp('잘못된 사이즈입니다')
    return;
  end

  r2 = 0;
  r4 = 0;
  for i=2:(lx - 1)
    if rem(i, 2) == 0
      r4 += y(i);
    else
      r2 += y(i);
    end
  end

  h = x(2) - x(1);
  out = (h / 3) * (4 * r4 + 2 * r2 + y(1) + y(lx));
end
