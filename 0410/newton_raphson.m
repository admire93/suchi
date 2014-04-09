function r = newton_raphson(x, fname, f_primename)
  old = x;
  new = x;
  for i=1:1000
    new = old - (feval(fname, old) / feval(f_primename, old));
    if i ~=1 && rel_error(new, old, 0.005)
      break;
    end

    old = new;
  end

  stop_i = i;
  r = old;
end
