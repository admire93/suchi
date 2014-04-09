function x = newton_eg()
  function y = p(x)
    y = 2 + 4*(x-1);
    y = y + (x-1) * (x-3);
    y = y - (1/2) * (x-1) * (x - 3) * (x-4);
    y = y + (3/70) * (x -1) * (x-3) * (x-4) * (x-7);
  end
  p(2)
  p(5)
end
