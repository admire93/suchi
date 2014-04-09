function r = fixed_pos(x, fname)
  old = x;

  for i=1:1000
    y1 = feval(fname, old);

    if i ~=1 && rel_error(y1, old, 0.005)
      break;
    end

    old = y1;
  end

  stop_i = i;
  r = old;
end
