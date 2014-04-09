function x = run_fixed()
  disp("방정식 x^3-4x+2 = 0 의 근사해");
  %[r, i] = fixed_pos(-3, "f");
  %printf("초기값: x0=-3, 근사해: %f (%d회 반복)\n", r, i);

  [r, i] = fixed_pos(-2, "f");
  printf("초기값: x0=-2, 근사해: %f (%d회 반복)\n", r, i);
end
