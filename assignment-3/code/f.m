function ret = f (x)
    % ackley function
    sigma1 = 0;
    sigma2 = 0;
    [n,_] = size(x);
    for i = 1:n
        sigma1 = sigma1 + x(i)^2;
        sigma2 = sigma2 + cos((2 * pi) * x(i));
    end
    
    ret = -20 * exp(-0.2 * (sqrt((1 / n) * sigma1))) ...
    - exp((1/n) * sigma2) + 20 + exp(1);
end