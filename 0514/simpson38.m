function out = simpson38(x, y)
  lx = length(x);
  if rem(lx, 3) != 1 || lx < 2
    disp('잘못된 사이즈입니다')
    return;
  end

  r2 = 0;
  r3 = 0;
  for i=2:(lx - 1)
    if rem(i, 3) == 1
      r2 += y(i);
    else
      r3 += y(i);
    end
  end

  h = x(2) - x(1);
  out = ((3 * h) / 8) * (3 * r3 + 2 * r2 + y(1) + y(lx));
end
