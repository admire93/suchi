function r = run_ch_least()

  x = [1,2,3,5,7];
  y = [2.3, 4, 4.5,6.2,6.3];
  s = length(x);
  printf('주어진 점\n')
  for i= 1:s
    printf('(%.1f, %.1f), ', x(i), y(i));
  end
  printf('\n');

  ch_least_square(x, y, 3.5);

end
