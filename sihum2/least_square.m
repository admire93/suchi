%!test
%! x = [1, 2, 3, 5, 7];
%! y = [2.3, 4, 4.5, 6.2, 6.3];
%! expect = 4.5953;
%! res = least_square(x, y, 3.5);
%! assert(int32(res * 10000), int32(expect * 10000));
function out = least_square(x, y, xguess)
  n = length(x);

  sig_x = sum(x);
  sig_pow_x = sum(x .* x);
  S = [
    n sig_x;
    sig_x sig_pow_x
  ];

  F = [
    sum(y);
    sum(y .* x);
  ];

  A = inv(S) * F;

  out = polyval(fliplr(A'), xguess);
end
