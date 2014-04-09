function [r, stop_i] = bisection_method(x1, x2, fname)
  x3old = x1;

  for i=1:1000
    y1 = feval(fname, x1);
    y2 = feval(fname, x2);
    yflag = y1 * y2;

    if yflag > 0
      printf("f(x1) 과 f(x2) 의 부호가 같습니다.");
      break;
    end

    x3 = (x1 + x2) / 2;

    if i ~=1 && rel_error(x3, x3old, 0.0001)
      break;
    end

    [x1, x2] = choice_x(x1, x2, x3, fname);
    x3old = x3;
  end

  stop_i = i;
  r = x3;
end
