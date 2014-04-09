function [r, stop_i] = secant(x1, x2, fname)
  for i=1:1000
    y1 = feval(fname, x1);
    y2 = feval(fname, x2);
    x3 = x2 - y2 * (x2 - x1) / (y2 - y1);

    if i ~=1 && rel_error(x3, x2, 0.005)
      break;
    end

    [x1, x2] = choice_x(x1, x2, x3, fname);

    x1 = x2;
    x2 = x3;
  end

  stop_i = i;
  r = x3;
end
