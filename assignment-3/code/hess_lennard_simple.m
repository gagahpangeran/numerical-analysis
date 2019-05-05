function ret = hess_lennard_simple(k)
    ret = -(133056 * k ^ 6 - 30069) / (1024 * k ^ 14);
endfunction