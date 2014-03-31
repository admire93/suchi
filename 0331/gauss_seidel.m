function r = gauss_seidel(A, b, guess, iter, max_iter)
  [row, column] = size(guess);
  [TA, Tb] = jacobi_transform(A, b);
  old = guess(:, 1);
  for i=1:row
    guess(i, 1) = Tb(i, 1) - TA(i, :) * guess(:, 1);
  end

  iter += 1;
  if iter > max_iter
    r = guess;
  else
    r = gauss_seidel(TA, Tb, guess, iter, max_iter);
  end
end
