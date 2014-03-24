function B = make_leading1(A)
  r = find_lead(A(1, :));
  B = A(1, :) * inv(A(1, r));
end