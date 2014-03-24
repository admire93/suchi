function r = find_lead(A)
  for i=1:1:length(A)
    if A(i) != 0
      r = i;
      break
    end
  end
end