function [r, stop_i] = secant(x1, x2, fname)
  for i=1:1000
    y1 = feval(fname, x1);
    y2 = feval(fname, x2);

    yquan = y2 - y1;
    if yquan == 0
      disp("f(x2) - f(x1) 의 값이 0 이되었습니다.");
      break;
    end
    x3 = x2 - y2 * (x2 - x1) / yquan;

    if i ~=1 && rel_error(x3, x2, 0.005)
      break;
    end

    x1 = x2;
    x2 = x3;
  end

  stop_i = i;
  r = x3;
end
