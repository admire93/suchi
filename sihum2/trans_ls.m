%!test
%! x = [1, 2, 3, 5, 7];
%! y = [2.3, 4, 4.5, 6.2, 6.3];
%! expect = 4.3166;
%! res = trans_ls(x, y, 3.5);
%! assert(int32(res * 10000), int32(expect * 10000));
function out = trans_ls(x, y, xguess)
  n = length(x);

  sig_x = sum(x);
  sig_pow_x = sum(x .* x);
  S = [
    n sig_x;
    sig_x sig_pow_x
  ];

  F = [
    sum(log(y));
    sum(log(y) .* x);
  ];

  A = inv(S) * F;

  out = exp(A(1, 1)) * exp(A(2, 1) * xguess);
end
