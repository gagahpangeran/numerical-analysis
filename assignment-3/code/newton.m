function [x, f_x] = newton(f, grad_f, hess_f) 
    global tol_newton;
    global x_0_newton;
    
    x_k = x_0_newton;
    
    while norm(b = grad_f(x_k), inf) > tol_newton 
        h = hess_f(x_k);
        s = h\b;
        x_k = x_k-s;
        x_k
        grad_f(x_k)
    endwhile
    
    x = x_k;
    f_x = f(x)
endfunction