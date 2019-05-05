function [x, f_x] = steepest_descent_wrapper(x_0, tol)
    global tol_steepest_descent;
    global x_0_steepest_descent;
    tol_steepest_descent = tol;
    x_0_steepest_descent = x_0;
    [x, f_x] = steepest_descent(@f, @grad_f);
endfunction