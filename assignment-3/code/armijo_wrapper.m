function alpha = armijo_wrapper(alpha, xk, pk)
    global alpha_armijo
    global xk_armijo
    global pk_armijo
    alpha_armijo = alpha;
    xk_armijo = xk;
    pk_armijo = pk;
    alpha = armijo_backtrack(@f, @grad_f);
end