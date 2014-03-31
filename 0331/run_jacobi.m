function  x = run_jacobi()
  A = [
    4 2 1 0;
    2 3 1 -2;
    1 -1 1 0;
    1 1 1 4;
  ];
  b = [2;2;0;2];
  b2 = [0; 4; 1; -2];
  max_iter = 6
  r1 = jacobi(A, b, [0;0;0;0], 0, max_iter);
  r2 = jacobi(A, b2, [0;0;0;0], 0, max_iter);
  r3 = gauss_seidel(A, b, [0;0;0;0], 0, max_iter);
  r4 = gauss_seidel(A, b2,  [0;0;0;0], 0, max_iter);

  formatter = ['w','x','y','z'];
  disp('Jacobian iteration ANSWER')
  disp('init value (0, 0, 0, 0)')
  for i=1:4
    printf('%c=%f\n', formatter(i), r1(i))
  end

  disp('b (-2, 1, 0, 4)')
  for i=1:4
   printf('%c=%f\n', formatter(i), r2(i))
  end

  disp('Gauss seidel iteration ANSWER')
  disp('init value (0, 0, 0, 0)')
  for i=1:4
   printf('%c=%f\n', formatter(i), r3(i))
  end

  disp('b (-2, 1, 0, 4)')
  for i=1:4
   printf('%c=%f\n', formatter(i), r4(i))
  end
end
