function [x, f_x] = quasi_newton_sr1_wrapper(x_0, tol)
    global x_0_quasi_newton_sr1
    global tol_quasi_newton_sr1
    x_0_quasi_newton_sr1 = x_0;
    tol_quasi_newton_sr1 = tol;
    [x, f_x] = quasi_newton_sr1(@f, @grad_f)
endfunction