function r = jacobi(A, b, guess, iter, max_iter)
  [row, column] = size(guess);
  [TA, Tb] = jacobi_transform(A, b);
  old = guess;
  improved = [];
  for i=1:row
    improved(i, 1) = Tb(i, 1) - TA(i, :) * old;
  end
  iter += 1;
  if iter > max_iter
    r = improved;
  else
    r = jacobi(A, b, improved, iter, max_iter);
  end
end
