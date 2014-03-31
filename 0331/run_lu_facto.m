function x = run_lu_facto()
  A = [
   2 3 1 -2;
   1 -1 1 0;
   1 1 1 4;
   2 3 1 0];
  b = [
    2;
    3;
    -1;
    2];
  formatter = ['w','x','y','z'];
  [row, column] = size(A);
  for i=1:row
    for j=1:column
      if A(i, j) > 0 && j != 1
        printf('+')
      end
      if A(i, j) != 0 && A(i, j) != 1
        printf('%d', A(i, j))
      end

      if A(i, j) != 0
        printf('%c', formatter(j))
      end

    end
    printf('=%d\n', b(row, 1))
  end
  r = lu_facto(A, b)';
  disp('ANSWER')
  for i=1:column
    printf('%c=%d\n', formatter(i), r(i))
  end
end
