function a = script1()
  A = [0 2 3 1 2; 0 2 2 2 3; 2 3 1 1 4; 2 4 0 1 2]
  [row, column] = size(A);
  B = get_ans(backward_subst(myref(A)))
  C = get_ans(myrref(A))
  l = column-1;
  F = A(:, 1:l);
  D = inv(F) * A(:, column);
  E = D'
end
