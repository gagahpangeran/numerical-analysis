function [x, f_x] = newton_wrapper(x_0, tol)
    global tol_newton;
    global x_0_newton;
    tol_newton = tol;
    x_0_newton = x_0;
    [x, f_x] = newton(@f, @grad_f, @hess_f);
endfunction