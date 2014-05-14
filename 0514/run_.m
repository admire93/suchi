function o = run_(start, end_, r)
  if rem(r, 6) != 1
    disp('잘못된 사이즈입니다. 6의 배수 + 1이되어야합니다.')
    return;
  end
  x = linspace(start, end_, r);
  y = sin(x .^ 2);

  printf('함수 sin(x^2)을 %d 에서부터 %d까지 %d 개로 나눴을때 \n', start, end_, r);
  printf('직사각형 적분법   : %f\n', rectangle(x, y));
  printf('사다리꼴 적분법   : %f\n', echelon(x, y));
  printf('simpson 1/3 적분법: %f\n', simpson13(x, y));
  printf('simpson 3/8 적분법: %f\n', simpson38(x, y));
end
