function o = run_(start, end_, r)

  function out = rectangle(x, y)
    lx = length(x);

    s = 0;
    for i=1:lx - 1
      s += (x(i + 1) - x(i)) * y(i);
    end

    out = s;
  end

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

  if rem(r, 6) != 1
    disp('잘못된 사이즈입니다. 6의 배수 + 1이되어야합니다.')
    return;
  end
  x = linspace(start, end_, r);
  y = sin(x .^ 2);

  printf('함수 sin(x^2)을 %d 에서부터 %d까지 %d 개로 나눴을때 \n',
         start, end_, r);
  printf('직사각형 적분법   : %f\n', rectangle(x, y));
  printf('사다리꼴 적분법   : %f\n', echelon(x, y));
  printf('simpson 1/3 적분법: %f\n', simpson13(x, y));
  printf('simpson 3/8 적분법: %f\n', simpson38(x, y));
end
