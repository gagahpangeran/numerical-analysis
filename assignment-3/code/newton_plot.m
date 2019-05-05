function [x, f_x] = newton(f, grad_f, hess_f) 
    global tol_newton;
    global x_0_newton;
    
    x_k = x_0_newton;
    count = 0
    lennard_jones_simple_plot(x_k, count)
    while norm(b = grad_f(x_k), inf) > tol_newton 
        count += 1
        h = hess_f(x_k);
        s = h\b;
        x_k = x_k-s;
        lennard_jones_simple_plot(x_k, count)
    endwhile
    count
    x = x_k;
    f_x = f(x)
endfunction