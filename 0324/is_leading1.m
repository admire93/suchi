function r = is_leading1(A)
  m_column = length(A) - 1;
  sum = 0;
  for i=1:1:m_column
    sum = sum + A(1, i);
  end
  r = (sum == 1);
end
