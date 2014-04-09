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
    flag = feval(fname, x1) * feval(fname, x3);
    rel_error = (abs(x3 - x3old) / x3) * 100;

    if i ~= 1 && rel_error < 0.005
      break;
    end

    if flag < 0
      x2 = x3;
    else
      x1 = x3;
    end
    x3old = x3;
  end

  stop_i = i;
  r = x3;
end
