function x = f_printer(fname, A)
  [row, column] = size(A);
  printf('%s=', fname);
  high_n = column - 1;
  for i=1:column
    printf('%d', A(i))
    if high_n > 1
      printf('x^%d', high_n);
    elseif high_n == 1
      printf('x')
    end
    if i != column
      printf('+');
    end
    high_n -= 1;
  end
  disp('')
end
