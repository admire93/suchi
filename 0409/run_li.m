function z = run_li()
  function y = f(x)
    y = 2 * sin(pi * (x / 6.0));
  end
  lagrange_interpolation([0, 1, 2, 1], [0, 1, 3, 5], 3.5)
end
