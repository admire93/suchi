function x = poly_script()
  function y = g(x)
    y = x-exp(-x);
  end
  F = [6, 5, 4, 3, 2];
  p = 4;
  f_prime = polyder(F);
  f_printer('f(x)', F);
  f_printer('f`(x)', f_prime);
  r_printer('f', p, polyval(F, p));
  r_printer('f`',p, polyval(f_prime, p));
  disp('g(x)=x-exp(-x)')
  for i=0:0.5:2
    r_printer('g', i, feval('g', i))
  end
end
