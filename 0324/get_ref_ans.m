function a = get_ref_ans(A)
  B = myref(A)
  a = get_ans(backward_subst(B));
end