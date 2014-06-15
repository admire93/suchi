function out = trans_ls(x, y, xguess)
  n = length(x);
  s = sum(x);
  S = [n s; s sum(x .* x)];
  loged_y = log(y);
  F = [sum(loged_y); sum(loged_y .* x)];

  A = inv(S) * F;
  out = exp(A(1, 1)) * exp(xguess * A(2, 1));
end
