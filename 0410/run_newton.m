function x = run_newton()
  disp("방정식 x^3-4x+2 = 0 의 근사해");
  [r, i] = newton_raphson(-3, "f", "fprime");
  printf("초기값: x0=  -3, 근사해: %f (%d회 반복)\n", r, i);

  [r, i] = newton_raphson(1.15, "f", "fprime");
  printf("초기값: x0=1.15, 근사해: %f (%d회 반복)\n", r, i);
end
