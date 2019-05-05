function [x, f_x] = steepest_descent(f, grad_f)
    global tol_steepest_descent;
    global x_0_steepest_descent;

    x_k = x_0_steepest_descent;
    while norm(p_k = -1 * grad_f(x_k), inf) > tol_steepest_descent
        a = armijo_wrapper(1, x_k, p_k);
        x_k = x_k + a * p_k;
    endwhile
    
    x = x_k;
    f_x = f(x);
endfunction