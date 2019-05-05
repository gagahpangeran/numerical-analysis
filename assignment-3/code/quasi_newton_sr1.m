function [x, f_x] = quasi_newton_sr1(f, grad_f)
    global x_0_quasi_newton_sr1
    global tol_quasi_newton_sr1 

    x_k = x_0_quasi_newton_sr1;
    
    [row col] = size(grad_f(x_k));
    
    % creates identity matrix w/ size row*row
    b_k = eye(row); 
    tol = tol_quasi_newton_sr1;

    while norm(h=grad_f(x_k), inf) > tol_quasi_newton_sr1
        old_x_k = x_k;

        p_k = -1 * b_k * grad_f(x_k);
        a = armijo_wrapper(1, x_k, p_k);
    
        x_k = x_k + a * p_k;    
        % BEGIN update SR-1 
    
        x_k
        grad_f(x_k)

        delta = x_k - old_x_k;
        gammax = grad_f(x_k) - grad_f(old_x_k);  
        dby = delta - b_k * gammax;
    
        if (dby != 0)
            b_k = b_k + ((dby) * dby') / (dby' * gammax)
        endif
        % END  

    end 
    x = x_k;
    f_x = f(x);
endfunction