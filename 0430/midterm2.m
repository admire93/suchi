function root = midterm2(f1, f2, fprime, x, threshold)
% f1 고정점 반복용 함수
% f2 원래 함수
% fprime 원래 함수의 미분함수
function r = rel_error(xold, xnew)
  r = abs(xnew - xold) / xnew;
end

  function [r i] = fixpos(f, x, threshold)
    max_iter = 10000;

    xold = x;
    for i=1:max_iter
      xnew = feval(f, xold);
      if rel_error(xold, xnew) < threshold
        break
      end
      xold = xnew;
    end

    r = xold;
  end

  function [r i] = newton(f, fprime, x, threshold)
    max_iter = 10000;

    xold = x;
    for i=1:max_iter

      xnew = xold - (feval(f, xold) / feval(fprime, xold));
      if i ~= 1 && rel_error(xold, xnew) < threshold
        break
      end

      xold = xnew;
    end

    r = xold;
  end


  x_len = length(x); 

  for i=1:x_len
    [r idx] = fixpos(f1, x(i), threshold);
    fixed_result(i) = r;
    fixed_result_iter(i) = idx;
  end

  for i=1:x_len
    [r idx] = newton(f2, fprime, x(i), threshold);
    newton_result(i) = r;
    newton_result_iter(i) = idx;
  end

  disp('init');
  fprintf('%.2f %.2f %.2f %.2f %.2f\n', x);

  disp('fixed point');
  for i=1:x_len
    fprintf('%.2f (%d itered) \t', fixed_result(i), fixed_result_iter(i));
  end
  fprintf('\n');
  disp('newton');
  for i=1:x_len
    fprintf('%.2f (%d itered) \t', newton_result(i), newton_result_iter(i));
  end
end
