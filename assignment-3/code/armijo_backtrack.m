function alpha = armijo_backtrack(f, grad)
    global alpha_armijo;
    global xk_armijo;
    global pk_armijo;
    alpha = alpha_armijo;
    xk_alph = [];
    [row col] = size(xk_armijo);
    grad_xk =grad(xk_armijo)' * pk_armijo;
    
    for i = (1:row)
        xk_alph = [xk_alph xk_armijo(i) + alpha * pk_armijo(i)];
    end
    
    c1 = f(xk_alph);
    c2 = f(xk_armijo);
    c2 = c2 + 0.1 * alpha * grad_xk;
    while ( c1 > c2)
        alpha = 0.5 * alpha;
        
        xk_alph = [];
        for i = (1:row)
            xk_alph = [xk_alph xk_armijo(i) + alpha * pk_armijo(i)];
        end
        
        c1 = f(xk_alph);
        c2 = f(xk_armijo);
        c2 = c2 + 0.1 * alpha * grad_xk ;
    end
    alpha = 0.5 * alpha;
end