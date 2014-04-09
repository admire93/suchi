function y = fprime(x)
  primed = polyder([1, 0, -4, 2]);
  y = polyval(primed, x);
end
