function [x1, x2] = choice_x(x1_, x2_, x3, fname)
    flag = feval(fname, x1) * feval(fname, x3);
    if flag < 0
      x1 = x1_;
      x2 = x3_;
    else
      x1 = x3;
      x2 = x2_;
    end
end
