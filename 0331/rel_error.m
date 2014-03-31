function r = rel_error(guess, old, tolerance)
  all = (guess - old) ./ guess;
  [row, column] = size(all);
  error_rate = abs(sum(all) / row);
  r = (error_rate <= tolerance);
end
