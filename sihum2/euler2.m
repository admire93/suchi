%!test
%! res = euler2(0, 4, 20, 0.1);
%! expect = 0.0015238;
%! assert(int32(res * 10^6),  int32(expect * 10^6));
function out = euler2(start, til, n, y)
end
