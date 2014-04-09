function r = rel_error(new, old, t)
  e = (abs(new - old) / abs(new)) * 100;
  r = (e < t);
end
